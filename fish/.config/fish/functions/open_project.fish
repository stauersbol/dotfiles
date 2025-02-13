function open_project
    # Find first-level subdirectories in ~/Projects
    set parent_dirs (fd . --type directory --max-depth 1 ~/Projects)

    # Collect valid project paths
    set projects
    for dir in $parent_dirs
        # Check if any subdirectory contains a .git folder
        set subprojects (fd --full-path $dir --type directory -H --max-depth 2 $dir | grep -P '\.(git)/$' | sed 's|/\.git||')
        set projects $projects $subprojects
    end

    # If no projects are found, exit early
    if test (count $projects) -eq 0
        return 1
    end

    # Use fzf to display only the last two parts of the directory name (parent/subfolder)
    set selected (printf "%s\n" $projects | fzf --cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --preview 'tree -L 1 {}')

    # Exit if no selection is made
    if test -z "$selected"
        commandline -f repaint
        return 1
    end

    set session_name (basename $selected)

    # Create a temporary layout file with the correct path
    set layout_file "/tmp/zellij_layout_$session_name.kdl"
    sed "s|__PROJECT_PATH__|$selected|g" ~/.config/zellij/layouts/git_project.kdl >$layout_file

    # Check if the session already exists
    if zellij list-sessions | grep -G "^$session_name"
        # Attach to the existing session
        zellij attach $session_name
    else
        # Start a new session in the project directory with the modified layout
        zellij --layout $layout_file
    end
end

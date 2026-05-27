{
    programs.kitty = {
        enable = true;
        enableGitIntegration = false;
        # themeFile = "MaterialDark"; # https://github.com/kovidgoyal/kitty-themes/tree/master/themes
        settings = {
            shell = "fish";
            window_padding_width = 8;
            cursor_trail = 1;
            background_opacity = 0.8;
        };
    };
}
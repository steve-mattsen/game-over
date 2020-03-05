//Display title screen
if (os_browser != browser_not_a_browser) {
	window_set_size(display_get_width(), display_get_height());
} else if (os_type == os_windows) {
	window_set_size(504,288);
}
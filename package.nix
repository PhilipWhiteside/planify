# Dependencies
{
	stdenv,
	lib,
	desktop-file-utils,
	meson,
	ninja,
	pkg-config,
	vala,
	wrapGAppsHook4,
	evolution-data-server-gtk4,
	glib,
	glib-networking,
	gst_all_1,
	gtk4,
	gtksourceview5,
	gxml,
	json-glib,
	libadwaita,
	libgee,
	libical,
	libportal-gtk4,
	libsecret,
	libsoup_3,
	libspelling,
	pantheon,
	sqlite,
	webkitgtk_6_0,
}:
# Package definition
stdenv.mkDerivation {
	pname = "planify";
	version = "4.11.6";

	src = ./.;

	# Build tools
	nativeBuildInputs = [
		desktop-file-utils
		meson
		ninja
		pkg-config
		vala
		wrapGAppsHook4
	];

	# Runtime dependencies
	buildInputs = [
		evolution-data-server-gtk4
		glib
		glib-networking
		# Needed for GtkMediaStream creation with success.ogg, see #311295.
		gst_all_1.gst-plugins-base
		gst_all_1.gst-plugins-good
		gtk4
		gtksourceview5
		gxml
		json-glib
		libadwaita
		libgee
		libical
		libportal-gtk4
		libsecret
		libsoup_3
		libspelling
		pantheon.granite7
		sqlite
		webkitgtk_6_0
	];

	# Build configuration
	mesonFlags = [
		"-Dprofile=default"
	];

	# Package metadata
	meta = with lib; {
		description = "Task manager with Todoist, Nextcloud & CalDAV support designed for GNOME";
		homepage = "https://github.com/alainm23/planify";
		license = licenses.gpl3Plus;
		maintainers = with maintainers; [] ++ teams.pantheon.members;
		platforms = platforms.linux;
		mainProgram = "io.github.alainm23.planify";
	};
}

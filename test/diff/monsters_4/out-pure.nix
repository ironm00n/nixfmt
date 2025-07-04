{
  /* Foo */ stdenv,
  /* Foo */ /* Foo */ lib,
  /* Foo */ /* Foo */ fetchFromGitLab,
  /* Foo */ /* Foo */ cairo,
  /* Foo */ /* Foo */ desktop-file-utils,
  /* Foo */ /* Foo */ gettext,
  /* Foo */ /* Foo */ glib,
  /* Foo */ /* Foo */ gtk4,
  /* Foo */ /* Foo */ libadwaita,
  /* Foo */ /* Foo */ meson,
  /* Foo */ /* Foo */ ninja,
  /* Foo */ /* Foo */ pango,
  /* Foo */ /* Foo */ pkg-config,
  /* Foo */ /* Foo */ python3,
  /* Foo */ /* Foo */ rustPlatform,
  /* Foo */ /* Foo */ wrapGAppsHook4,
/* Foo */ }:
/* Foo */ stdenv.mkDerivation /* Foo */ rec /* Foo */ {
  /* Foo */
  pname /* Foo */ = /* Foo */ "contrast";
  /* Foo */
  version /* Foo */ = /* Foo */ "0.0.5";
  /* Foo */
  src /* Foo */ = /* Foo */ fetchFromGitLab /* Foo */ {
    /* Foo */
    domain /* Foo */ = /* Foo */ "gitlab.gnome.org";
    /* Foo */
    group /* Foo */ = /* Foo */ "World";
    /* Foo */
    owner /* Foo */ = /* Foo */ "design";
    /* Foo */
    repo /* Foo */ = /* Foo */ "contrast";
    /* Foo */
    rev /* Foo */ = /* Foo */ version;
    /* Foo */
    sha256 /* Foo */ = /* Foo */ "cypSbqLwSmauOoWOuppWpF3hvrxiqmkLspxAWzvlUC0=";
    /* Foo */
  };
  /* Foo */
  cargoDeps /* Foo */ = /* Foo */ rustPlatform.fetchCargoTarball /* Foo */ {
    /* Foo */
    inherit /* Foo */ src;
    /* Foo */
    name /* Foo */ = /* Foo */ "${pname}-${version}";
    /* Foo */
    hash /* Foo */ = /* Foo */ "sha256-W4FyqwJpimf0isQRCq9TegpTQPQfsumx40AFQCFG5VQ=";
    /* Foo */
  };
  /* Foo */
  nativeBuildInputs /* Foo */ = /* Foo */ [
    /* Foo */
    desktop-file-utils
    /* Foo */
    gettext
    /* Foo */
    meson
    /* Foo */
    ninja
    /* Foo */
    pkg-config
    /* Foo */
    python3
    /* Foo */
    rustPlatform.rust.cargo
    /* Foo */
    rustPlatform.cargoSetupHook
    /* Foo */
    rustPlatform.rust.rustc
    /* Foo */
    wrapGAppsHook4
    /* Foo */
    glib
    /* Foo */ # for glib-compile-resources
    /* Foo */
  ];
  /* Foo */
  buildInputs /* Foo */ = /* Foo */ [
    /* Foo */
    cairo
    /* Foo */
    glib
    /* Foo */
    gtk4
    /* Foo */
    libadwaita
    /* Foo */
    pango
    /* Foo */
  ];
  /* Foo */
  postPatch /* Foo */ = /* Foo */ ''
    patchShebangs build-aux/meson_post_install.py
    # https://gitlab.gnome.org/World/design/contrast/-/merge_requests/23
    substituteInPlace build-aux/meson_post_install.py \
      --replace "gtk-update-icon-cache" "gtk4-update-icon-cache"
  '';
  /* Foo */
  meta /* Foo */ = /* Foo */ with /* Foo */ lib; /* Foo */ {
    /* Foo */
    description /* Foo */ = /* Foo */ "Checks whether the contrast between two colors meet the WCAG requirements";
    /* Foo */
    homepage /* Foo */ = /* Foo */ "https://gitlab.gnome.org/World/design/contrast";
    /* Foo */
    license /* Foo */ = /* Foo */ licenses.gpl3Plus;
    /* Foo */
    maintainers /* Foo */ = /* Foo */ with /* Foo */ maintainers; /* Foo */ [
      /* Foo */
      jtojnar
      /* Foo */
    ];
    /* Foo */
    platforms /* Foo */ = /* Foo */ platforms.unix;
    /* Foo */
  };
  /* Foo */
}

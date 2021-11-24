{ stdenv
, lib
, fetchFromGitHub
, cmake
, libuv
, libmicrohttpd
, openssl
, hwloc
, donateLevel ? 0
}:

stdenv.mkDerivation rec {
  pname = "xmrig";
  version = "6.15.3";

  src = fetchFromGitHub {
    owner = "xmrig";
    repo = "xmrig";
    rev = "v${version}";
    sha256 = "sha256-z97/0jAP/NtlaJtr+2qtQuo6VHSAZbzE9UAo43UJNQE=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ libuv libmicrohttpd openssl hwloc ];

  inherit donateLevel;

  patches = [ ./donate-level.patch ];
  postPatch = ''
    substituteAllInPlace src/donate.h
  '';

  installPhase = ''
    runHook preInstall

    install -vD xmrig $out/bin/xmrig
    
    runHook postInstall
  '';

  meta = with lib; {
    description = "Monero (XMR) CPU miner";
    homepage = "https://github.com/xmrig/xmrig";
    license = licenses.gpl3Plus;
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    maintainers = with maintainers; [ fpletz kim0 ];
  };
}

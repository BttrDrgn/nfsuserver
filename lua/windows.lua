workspace "NFSU Server"
	location "../build/"

	targetdir "%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}/%{cfg.platform}/"
	objdir "%{wks.location}/obj/%{prj.name}/%{cfg.buildcfg}/%{cfg.platform}/"
	buildlog "%{wks.location}/obj/%{prj.name}/%{cfg.platform}/%{cfg.buildcfg}/%{prj.name}.log"

	largeaddressaware "on"
	editandcontinue "off"
	staticruntime "on"

	systemversion "latest"
	characterset "ascii"
	warnings "extra"

	flags {
		"shadowedvariables",
		"multiprocessorcompile",
		"undefinedidentifiers",
	}

	platforms {
		"Win-x86",
		"Win-x64",
	}

	configurations {
		"Release",
		"Debug",
	}

	--x86
	filter "platforms:Win-x86"
		architecture "x86"
	--end

	--x64
	filter "platforms:Win-x64"
		architecture "x86_64"
	--end

	filter "Release"
		defines "NDEBUG"
		optimize "full"
		runtime "release"
		symbols "off"

	filter "Debug"
		defines "DEBUG"
		optimize "debug"
		runtime "debug"
		symbols "on"

	project "server"
		targetname "server"
		language "c++"
		cppdialect "c++20"
		warnings "off"

		kind "consoleapp"

		includedirs {
			"../src/server/",
			"../src/shared/",
		}

		files {
			"../src/server/**",
			"../src/shared/**",
		}

	project "client"
		targetname "client"
		language "c++"
		cppdialect "c++20"
		warnings "off"

		kind "windowedapp"

		includedirs {
			"../src/client/",
			"../src/shared/",
		}

		files {
			"../src/client/**",
			"../src/shared/**",
		}

import qbs
import qbs.Probes

Module {
    readonly property bool found: XCB.xcb.found && probe.found
    readonly property string packageVersion: probe.modversion

    Depends { name: "cpp" }
    Depends { name: "XCB.xcb" }

    cpp.defines: base.concat(probe.defines == undefined ? [] : probe.defines)
    cpp.commonCompilerFlags: base.concat(probe.compilerFlags == undefined ? [] : probe.compilerFlags)
    cpp.includePaths: base.concat(probe.includePaths == undefined ? [] : probe.includePaths)
    cpp.libraryPaths: base.concat(probe.libraryPaths == undefined ? [] : probe.libraryPaths)
    cpp.dynamicLibraries: base.concat(probe.libraries == undefined ? [] : probe.libraries)
    cpp.linkerFlags: base.concat(probe.linkerFlags == undefined ? [] : probe.linkerFlags)

    Probes.PkgConfigProbe {
        id: probe
        name: "xcb-xfixes"
    }
}

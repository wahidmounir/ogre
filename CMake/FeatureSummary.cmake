#-------------------------------------------------------------------
# This file is part of the CMake build system for OGRE
#     (Object-oriented Graphics Rendering Engine)
# For the latest info, see http://www.ogre3d.org/
#
# The contents of this file are placed in the public domain. Feel
# free to make use of it in any way you like.
#-------------------------------------------------------------------

# This file prints a summary of the selected build features.

set(_features "\n")
set(_features "${_features}----------------------------------------------------------------------------\n")
set(_features "${_features}  FEATURE SUMMARY\n")
set(_features "${_features}----------------------------------------------------------------------------\n\n")

#summarise components
if (OGRE_BUILD_COMPONENT_BITES)
	set(_components "${_components}  + Bites [BETA]\n")
endif ()
if (OGRE_BUILD_COMPONENT_HLMS)
	set(_components "${_components}  + HLMS [BETA]\n")
endif ()
if (OGRE_BUILD_COMPONENT_MESHLODGENERATOR)
	set(_components "${_components}  + MeshLodGenerator\n")
endif ()
if (OGRE_BUILD_COMPONENT_OVERLAY)
	set(_components "${_components}  + Overlay\n")
endif ()
if (OGRE_BUILD_COMPONENT_PAGING)
	set(_components "${_components}  + Paging\n")
endif ()
if (OGRE_BUILD_COMPONENT_PROPERTY)
	set(_components "${_components}  + Property [DEPRECATED]\n")
endif ()
if (OGRE_BUILD_COMPONENT_PYTHON)
	set(_components "${_components}  + Python [BETA]\n")
endif ()
if (OGRE_BUILD_COMPONENT_JAVA)
	set(_components "${_components}  + Java/ JNI [BETA]\n")
endif ()
if (OGRE_BUILD_COMPONENT_RTSHADERSYSTEM)
	set(_components "${_components}  + RTShader System\n")

	if (OGRE_BUILD_RTSHADERSYSTEM_CORE_SHADERS)
		set(_components "${_components}  + RTShader System Core Shaders\n")
	endif ()

	if (OGRE_BUILD_RTSHADERSYSTEM_EXT_SHADERS)
		set(_components "${_components}  + RTShader System Extensions Shaders\n")
	endif ()

endif ()
if (OGRE_BUILD_COMPONENT_TERRAIN)
	set(_components "${_components}  + Terrain\n")
endif ()
if (OGRE_BUILD_COMPONENT_VOLUME)
	set(_components "${_components}  + Volume\n")
endif ()

if (DEFINED _components)
	set(_features "${_features}Building components:\n${_components}")
endif ()

# summarise plugins
if (OGRE_BUILD_PLUGIN_BSP)
	set(_plugins "${_plugins}  + BSP scene manager\n")
endif ()
if (OGRE_BUILD_PLUGIN_CG)
	set(_plugins "${_plugins}  + Cg program manager\n")
endif ()
if (OGRE_BUILD_PLUGIN_OCTREE)
	set(_plugins "${_plugins}  + Octree scene manager\n")
endif ()
if(OGRE_BUILD_PLUGIN_EXRCODEC)
	set(_plugins "${_plugins}  + OpenEXR image codec\n")
endif()
if (OGRE_BUILD_PLUGIN_PCZ)
	set(_plugins "${_plugins}  + Portal connected zone scene manager\n")
endif ()
if (OGRE_BUILD_PLUGIN_PFX)
	set(_plugins "${_plugins}  + Particle FX\n")
endif ()

if (DEFINED _plugins)
	set(_features "${_features}Building plugins:\n${_plugins}")
endif ()

# summarise rendersystems
if (OGRE_BUILD_RENDERSYSTEM_D3D9)
	set(_rendersystems "${_rendersystems}  + Direct3D 9\n")
endif ()
if (OGRE_BUILD_RENDERSYSTEM_D3D11)
	set(_rendersystems "${_rendersystems}  + Direct3D 11\n")
endif ()
if (OGRE_BUILD_RENDERSYSTEM_GL)
	set(_rendersystems "${_rendersystems}  + OpenGL\n")
endif ()
if (OGRE_BUILD_RENDERSYSTEM_GL3PLUS)
	set(_rendersystems "${_rendersystems}  + OpenGL 3+\n")
endif ()
if (OGRE_BUILD_RENDERSYSTEM_GLES2)
	set(_rendersystems "${_rendersystems}  + OpenGL ES 2.x\n")
endif ()

if (DEFINED _rendersystems)
	set(_features "${_features}Building rendersystems:\n${_rendersystems}")
endif ()

# summarise programs
if (OGRE_BUILD_SAMPLES)
	set(_programs "${_programs}  + Samples\n")
endif ()
if (OGRE_BUILD_TESTS)
	set(_programs "${_programs}  + Tests\n")
endif ()
if (OGRE_BUILD_TOOLS)
	set(_programs "${_programs}  + Tools\n")
endif ()

if (DEFINED _programs)
	set(_features "${_features}Building executables:\n${_programs}")
endif ()

# summarise core features
if (OGRE_CONFIG_ENABLE_MESHLOD)
	set(_core "${_core}  + Mesh Lod\n")
endif ()
if (OGRE_CONFIG_ENABLE_DDS)
	set(_core "${_core}  + DDS image codec (.dds)\n")
endif ()
if (OGRE_CONFIG_ENABLE_PVRTC)
	set(_core "${_core}  + PVRTC image codec (.pvr)\n")
endif ()
if (OGRE_CONFIG_ENABLE_ETC)
	set(_core "${_core}  + ETC image codec (.pkm, .ktx) \n")
endif ()
if (OGRE_CONFIG_ENABLE_FREEIMAGE)
	set(_core "${_core}  + FreeImage codec (generic)\n")
endif ()
if (OGRE_CONFIG_ENABLE_STBI)
	set(_core "${_core}  + STBI codec (generic)\n")
endif ()
if (OGRE_CONFIG_ENABLE_ASTC)
	set(_core "${_core}  + ASTC image codec (.astc)\n")
endif ()
if (OGRE_CONFIG_ENABLE_ZIP)
	set(_core "${_core}  + ZIP archives\n")
endif ()
if (OGRE_CONFIG_ENABLE_VIEWPORT_ORIENTATIONMODE)
	set(_core "${_core}  + Viewport orientation mode support\n")
endif ()
if (OGRE_CONFIG_ENABLE_GLES2_GLSL_OPTIMISER)
	set(_core "${_core}  + GLSL Optimiser for OpenGL ES 2.0\n")
endif ()
if (OGRE_CONFIG_ENABLE_GLES2_CG_SUPPORT)
	set(_core "${_core}  + Cg for OpenGL ES 2.0\n")
endif ()
if (OGRE_CONFIG_ENABLE_GL_STATE_CACHE_SUPPORT)
	set(_core "${_core}  + StateCacheManager for OpenGL\n")
endif ()
if (OGRE_CONFIG_ENABLE_GLES3_SUPPORT)
	set(_core "${_core}  + OpenGL ES 3.0 Support [BETA]\n")
endif ()
if (OGRE_CONFIG_ENABLE_QUAD_BUFFER_STEREO)
	set(_core "${_core}  + Quad Buffer Stereo Technology (EXPERIMENTAL)\n")
endif ()
if (DEFINED _core)
	set(_features "${_features}Building core features:\n${_core}")
endif ()


set(_features "${_features}\n")


# miscellaneous
macro(var_to_string VAR STR)
	if (${VAR})
		set(${STR} "enabled")
	else ()
		set(${STR} "disabled")
	endif ()
endmacro ()

# assert settings
if (OGRE_ASSERT_MODE EQUAL 0)
	set(_assert "standard")
elseif (OGRE_ASSERT_MODE EQUAL 1)
	set(_assert "release exceptions")
else ()
    set(_assert "exceptions")
endif()
# various true/false settings
var_to_string(OGRE_CONFIG_DOUBLE _double)
var_to_string(OGRE_CONFIG_NODE_INHERIT_TRANSFORM _inherit_transform)

# threading settings
if (OGRE_CONFIG_THREADS EQUAL 0 OR OGRE_CONFIG_THREADS EQUAL 3)
	set(_threads "none")
elseif (OGRE_CONFIG_THREADS EQUAL 1)
	set(_threads "resource loading (${OGRE_CONFIG_THREAD_PROVIDER}) [DEPRECATED]")
else ()
	set(_threads "resource preparation (${OGRE_CONFIG_THREAD_PROVIDER}) [DEPRECATED]")
endif ()
# build type
if (OGRE_STATIC)
	set(_buildtype "static")
else ()
	set(_buildtype "shared")
endif ()

if (OGRE_RESOURCEMANAGER_STRICT)
	set(_resmgr "strict")
else ()
	set(_resmgr "legacy [DEPRECATED]")
endif ()

set(_features "${_features}Build type:                      ${_buildtype}\n")
set(_features "${_features}Thread safety:                   ${_threads}\n")
set(_features "${_features}ResourceManager behaviour:       ${_resmgr}\n")
set(_features "${_features}Use double precision:            ${_double}\n")
set(_features "${_features}Nodes inherit transform:         ${_inherit_transform}\n")
set(_features "${_features}Assert mode:                     ${_assert}\n")


set(_features "${_features}\n----------------------------------------------------------------------------\n")

# Display results, terminate if anything required is missing
MACRO_DISPLAY_FEATURE_LOG()
message(STATUS ${_features})

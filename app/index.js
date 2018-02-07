/**
 * Application entry point
 */

// Load application styles
import 'styles/index.scss'
import GlslCanvas from 'glslCanvas'
import frag from 'frag.glsl'
import 'images/logo.svg'

// ================================
// START YOUR APP HERE
// ================================

const canvas = document.querySelector('canvas')
const sandbox = new GlslCanvas(canvas)
sandbox.load(frag)

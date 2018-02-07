import 'styles/index.scss'
import GlslCanvas from 'glslCanvas'
import frag from 'frag.glsl'
import 'images/logo.svg'

const canvas = document.querySelector('canvas')
const sandbox = new GlslCanvas(canvas)
sandbox.load(frag)

window.setTimeout(() => {
  document.body.classList.add('is-loaded')
}, 100)

window.setTimeout(() => {
  document.body.classList.add('no-transition')
}, 10000)

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../css/application"
import Vue from "vue/dist/vue.esm"
Rails.start()
ActiveStorage.start()
import TurbolinksAdapter from "vue-turbolinks"
Vue.use(TurbolinksAdapter)

import Dropdown from "../components/dropdown"
Vue.component("dropdown", Dropdown)
Vue.directive('click-outside', {
  bind: function (el, binding, vNode) {
    el.__vueClickOutside__ = event => {
      if (!el.contains(event.target)) {
        console.log('zzz')
        vNode.context[binding.expression](event)
        event.stopPropagation()
      }
    }
    document.body.addEventListener('click', el.__vueClickOutside__)
  },
  unbind: function (el, binding, vNode) {
    // Remove Event Listeners
    document.removeEventListener('click', el.__vueClickOutside__)
    el.__vueClickOutside__ = null
  }
})

document.addEventListener("turbo:load", () => {
  const app = new Vue({
    el: "[data-behavior='vue']",
  })
})

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const setupHeaderAndNav = () => {
  const header = document.querySelector(".header")
  const navLinks = document.querySelector(".nav-links")
  const toggle = document.querySelector(".mobile-menu-toggle")

  if (header) {
    const updateHeader = () => {
      if (window.scrollY > 50) {
        header.classList.add("scrolled")
      } else {
        header.classList.remove("scrolled")
      }
    }
    updateHeader()
    window.addEventListener("scroll", updateHeader, { passive: true })
  }

  if (toggle && navLinks) {
    const closeMenu = () => {
      navLinks.classList.remove("active")
      toggle.setAttribute("aria-expanded", "false")
    }

    toggle.addEventListener("click", () => {
      navLinks.classList.toggle("active")
      const isOpen = navLinks.classList.contains("active")
      toggle.setAttribute("aria-expanded", isOpen ? "true" : "false")
    })

    navLinks.querySelectorAll("a").forEach((link) => {
      link.addEventListener("click", closeMenu)
    })

    window.addEventListener("resize", () => {
      if (window.innerWidth > 968) {
        closeMenu()
      }
    })
  }
}

document.addEventListener("turbo:load", setupHeaderAndNav)

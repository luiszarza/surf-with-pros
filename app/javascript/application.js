// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"


const booking = document.querySelector('.booking_date input')
console.log(booking)
booking.insertAdjacentHTML('afterend', '<i class="booking-cal fa-solid fa-calendar-days"></i>');

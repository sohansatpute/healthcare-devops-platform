import {
  ArrowRight,
  CalendarCheck,
  ShieldCheck,
  Stethoscope,
} from "lucide-react";

function Hero() {
  return (
    <section className="hero" id="home">
      <div className="hero-container">

        <div className="hero-content">

          <div className="hero-badge">
            <Stethoscope size={16} />
            <span>Modern Healthcare Management</span>
          </div>

          <h1>
            Trusted Healthcare,
            <span> Simplified.</span>
          </h1>

          <p className="hero-description">
            Manage appointments, patients, doctors, and medical records
            through one secure and easy-to-use healthcare platform.
          </p>

          <div className="hero-actions">

            <button className="primary-button">
              Book an Appointment
              <ArrowRight size={18} />
            </button>

            <button className="secondary-button">
              Explore Doctors
            </button>

          </div>

          <div className="hero-features">

            <div className="hero-feature">
              <div className="feature-icon">
                <CalendarCheck size={18} />
              </div>

              <span>Easy Appointments</span>
            </div>

            <div className="hero-feature">
              <div className="feature-icon">
                <ShieldCheck size={18} />
              </div>

              <span>Secure Medical Records</span>
            </div>

          </div>

        </div>

        <div className="hero-image-wrapper">

          <div className="hero-image">
            <img
              src="/images/hero-doctor.jpg"
              alt="Healthcare professional assisting a patient"
            />
          </div>

        </div>

      </div>
    </section>
  );
}

export default Hero;
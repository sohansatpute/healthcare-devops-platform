import {
  ArrowRight,
  CalendarCheck,
  ShieldCheck,
} from "lucide-react";

function AppointmentCTA() {
  return (
    <section className="appointment-cta">
      <div className="appointment-cta-container">

        <div className="appointment-cta-content">

          <div className="cta-badge">
            <CalendarCheck size={16} />
            <span>Easy & Secure Appointments</span>
          </div>

          <h2>
            Your Health Deserves
            <span> Better Care.</span>
          </h2>

          <p>
            Take the next step toward better healthcare. Book an appointment
            with a trusted healthcare professional today.
          </p>

          <button className="cta-button">
            Book an Appointment
            <ArrowRight size={18} />
          </button>

        </div>

        <div className="appointment-cta-trust">

          <div className="cta-trust-icon">
            <ShieldCheck size={25} />
          </div>

          <div>
            <strong>Secure & Trusted</strong>
            <span>Your healthcare information stays protected.</span>
          </div>

        </div>

      </div>
    </section>
  );
}

export default AppointmentCTA;
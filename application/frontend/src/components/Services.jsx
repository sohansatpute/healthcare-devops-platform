import {
  CalendarCheck,
  ClipboardList,
  FileHeart,
  HeartPulse,
  ShieldCheck,
  Stethoscope,
} from "lucide-react";

function Services() {
  const services = [
    {
      icon: Stethoscope,
      title: "Doctor Consultation",
      description:
        "Connect with qualified healthcare professionals and get the care you need.",
    },
    {
      icon: CalendarCheck,
      title: "Appointment Management",
      description:
        "Book, manage, and track your healthcare appointments with ease.",
    },
    {
      icon: FileHeart,
      title: "Medical Records",
      description:
        "Keep important health records organized and accessible in one place.",
    },
    {
      icon: ClipboardList,
      title: "Prescription Management",
      description:
        "Manage prescriptions and treatment information through a centralized platform.",
    },
    {
      icon: HeartPulse,
      title: "Health Monitoring",
      description:
        "Track important health information and stay informed about your wellbeing.",
    },
    {
      icon: ShieldCheck,
      title: "Secure Healthcare Data",
      description:
        "Protect sensitive healthcare information with a security-focused platform.",
    },
  ];

  return (
    <section className="services-section" id="services">
      <div className="services-container">

        <div className="section-heading">
          <div className="section-badge">
            <HeartPulse size={15} />
            <span>Healthcare Services</span>
          </div>

          <h2>
            Everything You Need for
            <span> Better Healthcare</span>
          </h2>

          <p>
            A centralized platform designed to simplify healthcare
            management for patients and healthcare professionals.
          </p>
        </div>

        <div className="services-grid">
          {services.map((service) => {
            const Icon = service.icon;

            return (
              <div className="service-card" key={service.title}>

                <div className="service-icon">
                  <Icon size={24} />
                </div>

                <h3>{service.title}</h3>

                <p>{service.description}</p>

                <button className="service-link">
                  Learn more
                  <span>→</span>
                </button>

              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
}

export default Services;
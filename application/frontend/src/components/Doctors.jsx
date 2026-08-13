import {
  ArrowRight,
  Award,
  Star,
} from "lucide-react";

function Doctors() {
  const doctors = [
    {
      name: "Dr. Arjun Sharma",
      specialty: "Cardiologist",
      experience: "12+ Years Experience",
      rating: "4.9",
      image: "/images/doctor-1.jpg",
    },
    {
      name: "Dr. Ananya Patel",
      specialty: "Neurologist",
      experience: "10+ Years Experience",
      rating: "4.8",
      image: "/images/doctor-2.jpg",
    },
    {
      name: "Dr. Rohan Mehta",
      specialty: "Pediatrician",
      experience: "8+ Years Experience",
      rating: "4.9",
      image: "/images/doctor-3.jpg",
    },
  ];

  return (
    <section className="doctors-section" id="doctors">
      <div className="doctors-container">

        <div className="section-heading doctors-heading">

          <div className="section-badge">
            <Award size={15} />
            <span>Our Healthcare Professionals</span>
          </div>

          <h2>
            Meet Our
            <span> Specialists</span>
          </h2>

          <p>
            Experienced healthcare professionals committed to providing
            trusted, patient-focused care.
          </p>

        </div>

        <div className="doctors-grid">

          {doctors.map((doctor) => (
            <article className="doctor-card" key={doctor.name}>

              <div className="doctor-image-wrapper">

                <img
                  src={doctor.image}
                  alt={doctor.name}
                  className="doctor-image"
                />

                <div className="doctor-rating">
                  <Star size={14} fill="currentColor" />
                  <span>{doctor.rating}</span>
                </div>

              </div>

              <div className="doctor-info">

                <h3>{doctor.name}</h3>

                <p className="doctor-specialty">
                  {doctor.specialty}
                </p>

                <div className="doctor-experience">
                  <Award size={15} />
                  <span>{doctor.experience}</span>
                </div>

                <button className="doctor-link">
                  View Profile
                  <ArrowRight size={16} />
                </button>

              </div>

            </article>
          ))}

        </div>

        <div className="doctors-action">

          <button className="view-all-button">
            View All Doctors
            <ArrowRight size={17} />
          </button>

        </div>

      </div>
    </section>
  );
}

export default Doctors;
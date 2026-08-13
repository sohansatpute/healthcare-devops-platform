import {
  HeartPulse,
  Mail,
  MapPin,
  Phone,
  Globe,
  MessageCircle,
  Code2,
  Users,
} from "lucide-react";

function Footer() {
  return (
    <footer className="footer">
      <div className="footer-container">

        <div className="footer-main">

          {/* Brand */}
          <div className="footer-brand">

            <div className="footer-logo">
              <span className="footer-logo-icon">
                <HeartPulse size={21} />
              </span>

              <span>MediCare</span>
            </div>

            <p>
              A secure and easy-to-use healthcare platform designed to
              simplify appointments, medical records, and patient care.
            </p>

            <div className="footer-socials">

              <a href="#" aria-label="Website">
                <Globe size={17} />
              </a>

              <a href="#" aria-label="Community">
                <Users size={17} />
              </a>

              <a href="#" aria-label="Messages">
                <MessageCircle size={17} />
              </a>

              <a href="#" aria-label="Developer">
                <Code2 size={17} />
              </a>

            </div>

          </div>


          {/* Platform */}
          <div className="footer-column">

            <h3>Platform</h3>

            <a href="#home">Home</a>
            <a href="#services">Services</a>
            <a href="#doctors">Doctors</a>
            <a href="#about">About Us</a>

          </div>


          {/* Healthcare */}
          <div className="footer-column">

            <h3>Healthcare</h3>

            <a href="#services">Appointments</a>
            <a href="#services">Medical Records</a>
            <a href="#doctors">Find a Doctor</a>
            <a href="#services">Health Monitoring</a>

          </div>


          {/* Contact */}
          <div className="footer-column footer-contact">

            <h3>Contact</h3>

            <div className="footer-contact-item">
              <MapPin size={16} />
              <span>Pune, Maharashtra, India</span>
            </div>

            <div className="footer-contact-item">
                <Phone size={16} />
                <a href="tel:+917507512443">+91 75075 12443</a>
            </div>

            <div className="footer-contact-item">
                <Mail size={16} />
                <a href="mailto:satputesohan8@gmail.com">
                    satputesohan8@gmail.com
                </a>
            </div>

          </div>

        </div>


        {/* Footer Bottom */}
        <div className="footer-bottom">

          <p>
            © 2026 MediCare. All rights reserved.
          </p>

          <div className="footer-legal">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
          </div>

        </div>

      </div>
    </footer>
  );
}

export default Footer;
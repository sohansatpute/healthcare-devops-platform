import {
  Activity,
  Building2,
  Headphones,
  Users,
} from "lucide-react";

function Stats() {
  const stats = [
    {
      icon: Users,
      value: "10K+",
      label: "Patients",
    },
    {
      icon: Activity,
      value: "500+",
      label: "Healthcare Professionals",
    },
    {
      icon: Building2,
      value: "50+",
      label: "Partner Clinics",
    },
    {
      icon: Headphones,
      value: "24/7",
      label: "Support Available",
    },
  ];

  return (
    <section className="stats-section">
      <div className="stats-container">

        {stats.map((stat) => {
          const Icon = stat.icon;

          return (
            <div className="stat-item" key={stat.label}>

              <div className="stat-icon">
                <Icon size={21} />
              </div>

              <div>
                <div className="stat-value">
                  {stat.value}
                </div>

                <div className="stat-label">
                  {stat.label}
                </div>
              </div>

            </div>
          );
        })}

      </div>
    </section>
  );
}

export default Stats;
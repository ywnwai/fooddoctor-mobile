import 'package:food_doctor/features/jobs/domain/job_posting.dart';

abstract final class JobCatalog {
  static const jobs = <JobPosting>[
    JobPosting(
      id: 'qa-river',
      title: 'Quality assistant',
      company: 'River Bake House',
      status: 'Open',
      description:
          'Check incoming flour, record oven lots, and hold product that fails the day’s check. One shift in a bakery in Yangon.',
      salary: '350,000 – 450,000 ks',
      contact: '09 250 000 111',
    ),
    JobPosting(
      id: 'line-delta',
      title: 'Filling line operator',
      company: 'Delta Process Machines',
      status: 'Open',
      description:
          'Run a piston filler for sauces, change nozzles between lots, and write the downtime on the shift sheet.',
      salary: '400,000 – 520,000 ks',
      contact: '09 510 778 300',
    ),
    JobPosting(
      id: 'pack-shwe',
      title: 'Packing supervisor',
      company: 'Shwe Rice Ingredients',
      status: 'Closed',
      description:
          'Lead a packing team for rice flour bags. Confirm the lot code, the net weight, and the shipper before dispatch.',
      salary: '480,000 – 600,000 ks',
      contact: '09 250 441 180',
    ),
  ];

  static JobPosting? byId(String id) {
    for (final job in jobs) {
      if (job.id == id) {
        return job;
      }
    }
    return null;
  }
}

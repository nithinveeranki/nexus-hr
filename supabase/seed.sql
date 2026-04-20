-- ============================================================
-- NexusHR Seed Data
-- 8 Departments · 24 Designations · 120 Employees · Activity Logs
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- CLEANUP: Wipe existing data (order matters for FK constraints)
-- ────────────────────────────────────────────────────────────
TRUNCATE public.activity_logs CASCADE;
TRUNCATE public.user_roles CASCADE;
UPDATE public.departments SET manager_id = NULL;
TRUNCATE public.profiles CASCADE;
TRUNCATE public.designations CASCADE;
TRUNCATE public.departments CASCADE;

-- ────────────────────────────────────────────────────────────
-- DEPARTMENTS
-- ────────────────────────────────────────────────────────────
INSERT INTO public.departments (id, name, description) VALUES
  ('d0000001-0000-0000-0000-000000000001', 'Engineering',    'Software development and technical infrastructure'),
  ('d0000001-0000-0000-0000-000000000002', 'Product',        'Product strategy, roadmap, and user research'),
  ('d0000001-0000-0000-0000-000000000003', 'Design',         'UI/UX design, brand identity, and creative direction'),
  ('d0000001-0000-0000-0000-000000000004', 'Marketing',      'Growth marketing, content, SEO, and campaigns'),
  ('d0000001-0000-0000-0000-000000000005', 'Sales',          'Revenue generation, client relationships, and BD'),
  ('d0000001-0000-0000-0000-000000000006', 'Human Resources','Recruitment, L&D, payroll, and employee welfare'),
  ('d0000001-0000-0000-0000-000000000007', 'Finance',        'Accounting, budgeting, compliance, and auditing'),
  ('d0000001-0000-0000-0000-000000000008', 'Operations',     'Infrastructure, logistics, vendor management');

-- ────────────────────────────────────────────────────────────
-- DESIGNATIONS (3 per department)
-- ────────────────────────────────────────────────────────────
INSERT INTO public.designations (id, title, department_id, level) VALUES
  -- Engineering
  ('e0000001-0000-0000-0000-000000000001', 'Junior Software Engineer',    'd0000001-0000-0000-0000-000000000001', 'junior'),
  ('e0000001-0000-0000-0000-000000000002', 'Senior Software Engineer',    'd0000001-0000-0000-0000-000000000001', 'senior'),
  ('e0000001-0000-0000-0000-000000000003', 'Engineering Manager',         'd0000001-0000-0000-0000-000000000001', 'manager'),
  -- Product
  ('e0000001-0000-0000-0000-000000000004', 'Associate Product Manager',   'd0000001-0000-0000-0000-000000000002', 'junior'),
  ('e0000001-0000-0000-0000-000000000005', 'Senior Product Manager',      'd0000001-0000-0000-0000-000000000002', 'senior'),
  ('e0000001-0000-0000-0000-000000000006', 'VP of Product',               'd0000001-0000-0000-0000-000000000002', 'executive'),
  -- Design
  ('e0000001-0000-0000-0000-000000000007', 'UI/UX Designer',              'd0000001-0000-0000-0000-000000000003', 'mid'),
  ('e0000001-0000-0000-0000-000000000008', 'Senior Designer',             'd0000001-0000-0000-0000-000000000003', 'senior'),
  ('e0000001-0000-0000-0000-000000000009', 'Design Lead',                 'd0000001-0000-0000-0000-000000000003', 'lead'),
  -- Marketing
  ('e0000001-0000-0000-0000-000000000010', 'Marketing Analyst',           'd0000001-0000-0000-0000-000000000004', 'junior'),
  ('e0000001-0000-0000-0000-000000000011', 'Senior Marketing Manager',    'd0000001-0000-0000-0000-000000000004', 'senior'),
  ('e0000001-0000-0000-0000-000000000012', 'Head of Marketing',           'd0000001-0000-0000-0000-000000000004', 'manager'),
  -- Sales
  ('e0000001-0000-0000-0000-000000000013', 'Sales Executive',             'd0000001-0000-0000-0000-000000000005', 'junior'),
  ('e0000001-0000-0000-0000-000000000014', 'Senior Sales Manager',        'd0000001-0000-0000-0000-000000000005', 'senior'),
  ('e0000001-0000-0000-0000-000000000015', 'VP of Sales',                 'd0000001-0000-0000-0000-000000000005', 'executive'),
  -- HR
  ('e0000001-0000-0000-0000-000000000016', 'HR Coordinator',              'd0000001-0000-0000-0000-000000000006', 'junior'),
  ('e0000001-0000-0000-0000-000000000017', 'Senior HR Business Partner',  'd0000001-0000-0000-0000-000000000006', 'senior'),
  ('e0000001-0000-0000-0000-000000000018', 'Head of HR',                  'd0000001-0000-0000-0000-000000000006', 'manager'),
  -- Finance
  ('e0000001-0000-0000-0000-000000000019', 'Accountant',                  'd0000001-0000-0000-0000-000000000007', 'junior'),
  ('e0000001-0000-0000-0000-000000000020', 'Senior Financial Analyst',    'd0000001-0000-0000-0000-000000000007', 'senior'),
  ('e0000001-0000-0000-0000-000000000021', 'Finance Manager',             'd0000001-0000-0000-0000-000000000007', 'manager'),
  -- Operations
  ('e0000001-0000-0000-0000-000000000022', 'Operations Analyst',          'd0000001-0000-0000-0000-000000000008', 'junior'),
  ('e0000001-0000-0000-0000-000000000023', 'Senior Ops Manager',          'd0000001-0000-0000-0000-000000000008', 'senior'),
  ('e0000001-0000-0000-0000-000000000024', 'Head of Operations',          'd0000001-0000-0000-0000-000000000008', 'manager');

-- ────────────────────────────────────────────────────────────
-- EMPLOYEES (120 profiles)
-- ────────────────────────────────────────────────────────────

-- Engineering (25 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Arjun Mehta',       'arjun.mehta@nexushr.io',       '+91-9800100001', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000003', 'EMP-101', 'active', '2022-03-15', 180000),
  (gen_random_uuid(), 'Priya Sharma',      'priya.sharma@nexushr.io',      '+91-9800100002', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-102', 'active', '2022-06-01', 145000),
  (gen_random_uuid(), 'Rahul Desai',       'rahul.desai@nexushr.io',       '+91-9800100003', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-103', 'active', '2022-08-20', 140000),
  (gen_random_uuid(), 'Sneha Iyer',        'sneha.iyer@nexushr.io',        '+91-9800100004', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-104', 'active', '2023-01-10', 85000),
  (gen_random_uuid(), 'Vikram Reddy',      'vikram.reddy@nexushr.io',      '+91-9800100005', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-105', 'active', '2023-02-14', 82000),
  (gen_random_uuid(), 'Ananya Nair',       'ananya.nair@nexushr.io',       '+91-9800100006', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-106', 'active', '2022-11-05', 135000),
  (gen_random_uuid(), 'Karthik Bhat',      'karthik.bhat@nexushr.io',      '+91-9800100007', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-107', 'active', '2023-04-22', 78000),
  (gen_random_uuid(), 'Meera Joshi',       'meera.joshi@nexushr.io',       '+91-9800100008', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-108', 'on_leave', '2022-07-18', 138000),
  (gen_random_uuid(), 'Aditya Kulkarni',   'aditya.kulkarni@nexushr.io',   '+91-9800100009', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-109', 'active', '2023-06-30', 80000),
  (gen_random_uuid(), 'Divya Rao',         'divya.rao@nexushr.io',         '+91-9800100010', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-110', 'active', '2023-08-01', 76000),
  (gen_random_uuid(), 'Nikhil Verma',      'nikhil.verma@nexushr.io',      '+91-9800100011', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-111', 'active', '2022-09-12', 142000),
  (gen_random_uuid(), 'Pooja Gupta',       'pooja.gupta@nexushr.io',       '+91-9800100012', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-112', 'active', '2024-01-08', 72000),
  (gen_random_uuid(), 'Sanjay Pillai',     'sanjay.pillai@nexushr.io',     '+91-9800100013', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-113', 'active', '2022-05-25', 148000),
  (gen_random_uuid(), 'Ritu Agarwal',      'ritu.agarwal@nexushr.io',      '+91-9800100014', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-114', 'inactive', '2022-04-10', 75000),
  (gen_random_uuid(), 'Deepak Saxena',     'deepak.saxena@nexushr.io',     '+91-9800100015', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-115', 'active', '2024-02-19', 70000),
  (gen_random_uuid(), 'Kavitha Menon',     'kavitha.menon@nexushr.io',     '+91-9800100016', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-116', 'active', '2023-03-05', 136000),
  (gen_random_uuid(), 'Rohan Patil',       'rohan.patil@nexushr.io',       '+91-9800100017', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-117', 'active', '2023-09-15', 77000),
  (gen_random_uuid(), 'Swati Chatterjee',  'swati.chatterjee@nexushr.io',  '+91-9800100018', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-118', 'active', '2024-03-01', 71000),
  (gen_random_uuid(), 'Amit Patel',        'amit.patel@nexushr.io',        '+91-9800100019', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-119', 'active', '2022-10-11', 144000),
  (gen_random_uuid(), 'Lakshmi Sundaram',  'lakshmi.sundaram@nexushr.io',  '+91-9800100020', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-120', 'on_leave', '2023-05-20', 79000),
  (gen_random_uuid(), 'Gaurav Singh',      'gaurav.singh@nexushr.io',      '+91-9800100021', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-121', 'active', '2024-01-22', 73000),
  (gen_random_uuid(), 'Nandini Krishnan',  'nandini.krishnan@nexushr.io',  '+91-9800100022', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-122', 'active', '2023-07-14', 139000),
  (gen_random_uuid(), 'Suresh Gowda',      'suresh.gowda@nexushr.io',      '+91-9800100023', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-123', 'active', '2023-11-01', 74000),
  (gen_random_uuid(), 'Vidya Ranganathan', 'vidya.ranganathan@nexushr.io', '+91-9800100024', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000001', 'EMP-124', 'active', '2024-04-10', 69000),
  (gen_random_uuid(), 'Manish Tiwari',     'manish.tiwari@nexushr.io',     '+91-9800100025', 'd0000001-0000-0000-0000-000000000001', 'e0000001-0000-0000-0000-000000000002', 'EMP-125', 'active', '2022-12-03', 141000);

-- Product (12 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Shreya Kapoor',     'shreya.kapoor@nexushr.io',     '+91-9800200001', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000006', 'EMP-201', 'active', '2021-11-01', 220000),
  (gen_random_uuid(), 'Tarun Malhotra',    'tarun.malhotra@nexushr.io',    '+91-9800200002', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000005', 'EMP-202', 'active', '2022-02-15', 165000),
  (gen_random_uuid(), 'Anjali Das',        'anjali.das@nexushr.io',        '+91-9800200003', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000005', 'EMP-203', 'active', '2022-07-22', 158000),
  (gen_random_uuid(), 'Vishal Hegde',      'vishal.hegde@nexushr.io',      '+91-9800200004', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000004', 'EMP-204', 'active', '2023-03-10', 95000),
  (gen_random_uuid(), 'Isha Banerjee',     'isha.banerjee@nexushr.io',     '+91-9800200005', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000004', 'EMP-205', 'active', '2023-05-28', 92000),
  (gen_random_uuid(), 'Ravi Shankar',      'ravi.shankar@nexushr.io',      '+91-9800200006', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000005', 'EMP-206', 'on_leave', '2022-09-14', 162000),
  (gen_random_uuid(), 'Neha Saxena',       'neha.saxena@nexushr.io',       '+91-9800200007', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000004', 'EMP-207', 'active', '2023-08-02', 88000),
  (gen_random_uuid(), 'Pranav Goyal',      'pranav.goyal@nexushr.io',      '+91-9800200008', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000004', 'EMP-208', 'active', '2024-01-15', 86000),
  (gen_random_uuid(), 'Simran Kohli',      'simran.kohli@nexushr.io',      '+91-9800200009', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000005', 'EMP-209', 'active', '2022-04-18', 160000),
  (gen_random_uuid(), 'Abhinav Mishra',    'abhinav.mishra@nexushr.io',    '+91-9800200010', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000004', 'EMP-210', 'active', '2023-10-05', 90000),
  (gen_random_uuid(), 'Pallavi Srinivasan','pallavi.srinivasan@nexushr.io','+91-9800200011', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000004', 'EMP-211', 'active', '2024-02-20', 84000),
  (gen_random_uuid(), 'Dhruv Choudhary',   'dhruv.choudhary@nexushr.io',   '+91-9800200012', 'd0000001-0000-0000-0000-000000000002', 'e0000001-0000-0000-0000-000000000005', 'EMP-212', 'active', '2023-01-30', 155000);

-- Design (10 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Aishwarya Mohan',   'aishwarya.mohan@nexushr.io',   '+91-9800300001', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000009', 'EMP-301', 'active', '2022-01-20', 155000),
  (gen_random_uuid(), 'Kunal Thakur',      'kunal.thakur@nexushr.io',      '+91-9800300002', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000008', 'EMP-302', 'active', '2022-05-10', 130000),
  (gen_random_uuid(), 'Rashmi Kaur',       'rashmi.kaur@nexushr.io',       '+91-9800300003', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000007', 'EMP-303', 'active', '2023-02-28', 95000),
  (gen_random_uuid(), 'Siddharth Naidu',   'siddharth.naidu@nexushr.io',   '+91-9800300004', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000007', 'EMP-304', 'active', '2023-06-15', 92000),
  (gen_random_uuid(), 'Tanvi Ahuja',       'tanvi.ahuja@nexushr.io',       '+91-9800300005', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000008', 'EMP-305', 'on_leave', '2022-09-01', 128000),
  (gen_random_uuid(), 'Harsh Pandey',      'harsh.pandey@nexushr.io',      '+91-9800300006', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000007', 'EMP-306', 'active', '2023-11-12', 88000),
  (gen_random_uuid(), 'Megha Basu',        'megha.basu@nexushr.io',        '+91-9800300007', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000007', 'EMP-307', 'active', '2024-01-05', 85000),
  (gen_random_uuid(), 'Varun Chandra',     'varun.chandra@nexushr.io',     '+91-9800300008', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000008', 'EMP-308', 'active', '2022-11-20', 132000),
  (gen_random_uuid(), 'Ritika Sen',        'ritika.sen@nexushr.io',        '+91-9800300009', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000007', 'EMP-309', 'active', '2024-03-18', 82000),
  (gen_random_uuid(), 'Ashwin Nambiar',    'ashwin.nambiar@nexushr.io',    '+91-9800300010', 'd0000001-0000-0000-0000-000000000003', 'e0000001-0000-0000-0000-000000000007', 'EMP-310', 'active', '2023-08-25', 90000);

-- Marketing (15 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Aparna Raghavan',   'aparna.raghavan@nexushr.io',   '+91-9800400001', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000012', 'EMP-401', 'active', '2021-09-15', 175000),
  (gen_random_uuid(), 'Rajat Oberoi',      'rajat.oberoi@nexushr.io',      '+91-9800400002', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000011', 'EMP-402', 'active', '2022-03-01', 140000),
  (gen_random_uuid(), 'Kriti Bhargava',    'kriti.bhargava@nexushr.io',    '+91-9800400003', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-403', 'active', '2023-01-22', 78000),
  (gen_random_uuid(), 'Naveen Shetty',     'naveen.shetty@nexushr.io',     '+91-9800400004', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-404', 'active', '2023-04-10', 75000),
  (gen_random_uuid(), 'Shruti Deshpande',  'shruti.deshpande@nexushr.io',  '+91-9800400005', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000011', 'EMP-405', 'active', '2022-08-28', 138000),
  (gen_random_uuid(), 'Hemant Jha',        'hemant.jha@nexushr.io',        '+91-9800400006', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-406', 'active', '2023-07-05', 72000),
  (gen_random_uuid(), 'Gayatri Prasad',    'gayatri.prasad@nexushr.io',    '+91-9800400007', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-407', 'inactive', '2022-06-18', 70000),
  (gen_random_uuid(), 'Vivek Balaji',      'vivek.balaji@nexushr.io',      '+91-9800400008', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000011', 'EMP-408', 'active', '2022-12-10', 142000),
  (gen_random_uuid(), 'Reema Chadha',      'reema.chadha@nexushr.io',      '+91-9800400009', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-409', 'active', '2024-02-01', 68000),
  (gen_random_uuid(), 'Akash Tripathi',    'akash.tripathi@nexushr.io',    '+91-9800400010', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-410', 'active', '2023-10-20', 74000),
  (gen_random_uuid(), 'Jaya Lakshmi',      'jaya.lakshmi@nexushr.io',      '+91-9800400011', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000011', 'EMP-411', 'active', '2023-03-12', 136000),
  (gen_random_uuid(), 'Sameer Walia',      'sameer.walia@nexushr.io',      '+91-9800400012', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-412', 'on_leave', '2023-09-08', 76000),
  (gen_random_uuid(), 'Bhavna Reddy',      'bhavna.reddy@nexushr.io',      '+91-9800400013', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-413', 'active', '2024-03-25', 67000),
  (gen_random_uuid(), 'Nitin Arora',       'nitin.arora@nexushr.io',       '+91-9800400014', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000011', 'EMP-414', 'active', '2022-10-15', 145000),
  (gen_random_uuid(), 'Sunita Vohra',      'sunita.vohra@nexushr.io',      '+91-9800400015', 'd0000001-0000-0000-0000-000000000004', 'e0000001-0000-0000-0000-000000000010', 'EMP-415', 'active', '2023-12-01', 71000);

-- Sales (18 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Rajesh Kumar',      'rajesh.kumar@nexushr.io',      '+91-9800500001', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000015', 'EMP-501', 'active', '2021-06-01', 210000),
  (gen_random_uuid(), 'Monica Pillai',     'monica.pillai@nexushr.io',     '+91-9800500002', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000014', 'EMP-502', 'active', '2022-01-10', 155000),
  (gen_random_uuid(), 'Ajay Bhatt',        'ajay.bhatt@nexushr.io',        '+91-9800500003', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000014', 'EMP-503', 'active', '2022-04-20', 150000),
  (gen_random_uuid(), 'Sonal Khandelwal',  'sonal.khandelwal@nexushr.io',  '+91-9800500004', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-504', 'active', '2023-02-05', 72000),
  (gen_random_uuid(), 'Ramesh Babu',       'ramesh.babu@nexushr.io',       '+91-9800500005', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-505', 'active', '2023-05-15', 70000),
  (gen_random_uuid(), 'Fatima Sheikh',     'fatima.sheikh@nexushr.io',     '+91-9800500006', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-506', 'active', '2023-07-22', 68000),
  (gen_random_uuid(), 'Girish Mahajan',    'girish.mahajan@nexushr.io',    '+91-9800500007', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000014', 'EMP-507', 'active', '2022-08-30', 148000),
  (gen_random_uuid(), 'Chitra Venkat',     'chitra.venkat@nexushr.io',     '+91-9800500008', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-508', 'on_leave', '2023-09-10', 66000),
  (gen_random_uuid(), 'Pawan Sinha',       'pawan.sinha@nexushr.io',       '+91-9800500009', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-509', 'active', '2023-11-28', 65000),
  (gen_random_uuid(), 'Lata Parikh',       'lata.parikh@nexushr.io',       '+91-9800500010', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000014', 'EMP-510', 'active', '2022-06-14', 152000),
  (gen_random_uuid(), 'Yogesh Dhawan',     'yogesh.dhawan@nexushr.io',     '+91-9800500011', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-511', 'active', '2024-01-10', 63000),
  (gen_random_uuid(), 'Madhuri Iyer',      'madhuri.iyer@nexushr.io',      '+91-9800500012', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-512', 'active', '2024-02-28', 62000),
  (gen_random_uuid(), 'Sunil Chakraborty', 'sunil.chakraborty@nexushr.io', '+91-9800500013', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000014', 'EMP-513', 'active', '2022-11-05', 146000),
  (gen_random_uuid(), 'Tara Menon',        'tara.menon@nexushr.io',        '+91-9800500014', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-514', 'active', '2023-06-18', 69000),
  (gen_random_uuid(), 'Manoj Sethi',       'manoj.sethi@nexushr.io',       '+91-9800500015', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-515', 'inactive', '2022-03-22', 67000),
  (gen_random_uuid(), 'Usha Rajan',        'usha.rajan@nexushr.io',        '+91-9800500016', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-516', 'active', '2024-03-05', 61000),
  (gen_random_uuid(), 'Dinesh Narayan',    'dinesh.narayan@nexushr.io',    '+91-9800500017', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000014', 'EMP-517', 'active', '2023-04-12', 149000),
  (gen_random_uuid(), 'Hema Subramanian',  'hema.subramanian@nexushr.io',  '+91-9800500018', 'd0000001-0000-0000-0000-000000000005', 'e0000001-0000-0000-0000-000000000013', 'EMP-518', 'active', '2023-08-30', 64000);

-- HR (12 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Geeta Ramaswamy',   'geeta.ramaswamy@nexushr.io',   '+91-9800600001', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000018', 'EMP-601', 'active', '2021-08-01', 170000),
  (gen_random_uuid(), 'Prakash Yadav',     'prakash.yadav@nexushr.io',     '+91-9800600002', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000017', 'EMP-602', 'active', '2022-02-20', 135000),
  (gen_random_uuid(), 'Surbhi Luthra',     'surbhi.luthra@nexushr.io',     '+91-9800600003', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000017', 'EMP-603', 'active', '2022-06-12', 130000),
  (gen_random_uuid(), 'Arun Namboodiri',   'arun.namboodiri@nexushr.io',   '+91-9800600004', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000016', 'EMP-604', 'active', '2023-01-18', 65000),
  (gen_random_uuid(), 'Kamla Verma',       'kamla.verma@nexushr.io',       '+91-9800600005', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000016', 'EMP-605', 'active', '2023-04-25', 62000),
  (gen_random_uuid(), 'Mohan Das',         'mohan.das@nexushr.io',         '+91-9800600006', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000016', 'EMP-606', 'on_leave', '2023-07-14', 60000),
  (gen_random_uuid(), 'Revathi Srinivas',  'revathi.srinivas@nexushr.io',  '+91-9800600007', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000017', 'EMP-607', 'active', '2022-10-08', 132000),
  (gen_random_uuid(), 'Harish Bedi',       'harish.bedi@nexushr.io',       '+91-9800600008', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000016', 'EMP-608', 'active', '2024-01-28', 58000),
  (gen_random_uuid(), 'Padma Shukla',      'padma.shukla@nexushr.io',      '+91-9800600009', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000016', 'EMP-609', 'active', '2023-09-15', 61000),
  (gen_random_uuid(), 'Vinod Kapoor',      'vinod.kapoor@nexushr.io',      '+91-9800600010', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000016', 'EMP-610', 'active', '2024-03-10', 57000),
  (gen_random_uuid(), 'Saritha Menon',     'saritha.menon@nexushr.io',     '+91-9800600011', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000017', 'EMP-611', 'active', '2023-06-22', 128000),
  (gen_random_uuid(), 'Bhaskar Rao',       'bhaskar.rao@nexushr.io',       '+91-9800600012', 'd0000001-0000-0000-0000-000000000006', 'e0000001-0000-0000-0000-000000000016', 'EMP-612', 'active', '2023-11-18', 59000);

-- Finance (14 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Anurag Dubey',      'anurag.dubey@nexushr.io',      '+91-9800700001', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000021', 'EMP-701', 'active', '2021-10-10', 168000),
  (gen_random_uuid(), 'Shipra Mukherjee',  'shipra.mukherjee@nexushr.io',  '+91-9800700002', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000020', 'EMP-702', 'active', '2022-03-15', 138000),
  (gen_random_uuid(), 'Gopal Krishnan',    'gopal.krishnan@nexushr.io',    '+91-9800700003', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000020', 'EMP-703', 'active', '2022-07-28', 135000),
  (gen_random_uuid(), 'Savita Lal',        'savita.lal@nexushr.io',        '+91-9800700004', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-704', 'active', '2023-02-14', 62000),
  (gen_random_uuid(), 'Tushar Mane',       'tushar.mane@nexushr.io',       '+91-9800700005', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-705', 'active', '2023-05-08', 60000),
  (gen_random_uuid(), 'Janaki Easwaran',   'janaki.easwaran@nexushr.io',   '+91-9800700006', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000020', 'EMP-706', 'active', '2022-09-22', 136000),
  (gen_random_uuid(), 'Mahesh Hegde',      'mahesh.hegde@nexushr.io',      '+91-9800700007', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-707', 'on_leave', '2023-08-05', 58000),
  (gen_random_uuid(), 'Purnima Das',       'purnima.das@nexushr.io',       '+91-9800700008', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-708', 'active', '2023-10-30', 57000),
  (gen_random_uuid(), 'Shyam Sundaram',    'shyam.sundaram@nexushr.io',    '+91-9800700009', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000020', 'EMP-709', 'active', '2022-12-18', 140000),
  (gen_random_uuid(), 'Indira Bose',       'indira.bose@nexushr.io',       '+91-9800700010', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-710', 'active', '2024-01-22', 55000),
  (gen_random_uuid(), 'Naresh Chitnis',    'naresh.chitnis@nexushr.io',    '+91-9800700011', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-711', 'active', '2024-02-15', 54000),
  (gen_random_uuid(), 'Vandana Sharma',    'vandana.sharma@nexushr.io',    '+91-9800700012', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000020', 'EMP-712', 'active', '2023-04-20', 134000),
  (gen_random_uuid(), 'Kishore Swamy',     'kishore.swamy@nexushr.io',     '+91-9800700013', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-713', 'active', '2023-07-12', 59000),
  (gen_random_uuid(), 'Archana Dalvi',     'archana.dalvi@nexushr.io',     '+91-9800700014', 'd0000001-0000-0000-0000-000000000007', 'e0000001-0000-0000-0000-000000000019', 'EMP-714', 'inactive', '2022-05-30', 56000);

-- Operations (14 employees)
INSERT INTO public.profiles (id, full_name, email, phone, department_id, designation_id, employee_id, status, joining_date, salary) VALUES
  (gen_random_uuid(), 'Ganesh Kulkarni',   'ganesh.kulkarni@nexushr.io',   '+91-9800800001', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000024', 'EMP-801', 'active', '2021-07-15', 172000),
  (gen_random_uuid(), 'Uma Maheswari',     'uma.maheswari@nexushr.io',     '+91-9800800002', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000023', 'EMP-802', 'active', '2022-01-25', 142000),
  (gen_random_uuid(), 'Rajan Murthy',      'rajan.murthy@nexushr.io',      '+91-9800800003', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000023', 'EMP-803', 'active', '2022-05-18', 138000),
  (gen_random_uuid(), 'Vasanthi Nair',     'vasanthi.nair@nexushr.io',     '+91-9800800004', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-804', 'active', '2023-01-30', 64000),
  (gen_random_uuid(), 'Balaji Sundaram',   'balaji.sundaram@nexushr.io',   '+91-9800800005', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-805', 'active', '2023-04-15', 62000),
  (gen_random_uuid(), 'Lalitha Rao',       'lalitha.rao@nexushr.io',       '+91-9800800006', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-806', 'active', '2023-06-28', 60000),
  (gen_random_uuid(), 'Raghunath Pillai',  'raghunath.pillai@nexushr.io',  '+91-9800800007', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000023', 'EMP-807', 'on_leave', '2022-08-10', 140000),
  (gen_random_uuid(), 'Saraswati Devi',    'saraswati.devi@nexushr.io',    '+91-9800800008', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-808', 'active', '2023-09-05', 58000),
  (gen_random_uuid(), 'Chandrasekhar M',   'chandrasekhar.m@nexushr.io',   '+91-9800800009', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-809', 'active', '2023-11-20', 57000),
  (gen_random_uuid(), 'Sumathi Krishnan',  'sumathi.krishnan@nexushr.io',  '+91-9800800010', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000023', 'EMP-810', 'active', '2022-10-30', 144000),
  (gen_random_uuid(), 'Jagdish Patel',     'jagdish.patel@nexushr.io',     '+91-9800800011', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-811', 'active', '2024-01-05', 56000),
  (gen_random_uuid(), 'Mythili Anand',     'mythili.anand@nexushr.io',     '+91-9800800012', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-812', 'active', '2024-02-18', 55000),
  (gen_random_uuid(), 'Somasundaram P',    'somasundaram.p@nexushr.io',    '+91-9800800013', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000022', 'EMP-813', 'active', '2023-08-12', 59000),
  (gen_random_uuid(), 'Kalyani Reddy',     'kalyani.reddy@nexushr.io',     '+91-9800800014', 'd0000001-0000-0000-0000-000000000008', 'e0000001-0000-0000-0000-000000000023', 'EMP-814', 'active', '2023-03-25', 141000);

-- ────────────────────────────────────────────────────────────
-- SET DEPARTMENT MANAGERS
-- ────────────────────────────────────────────────────────────
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-101') WHERE name = 'Engineering';
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-201') WHERE name = 'Product';
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-301') WHERE name = 'Design';
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-401') WHERE name = 'Marketing';
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-501') WHERE name = 'Sales';
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-601') WHERE name = 'Human Resources';
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-701') WHERE name = 'Finance';
UPDATE public.departments SET manager_id = (SELECT id FROM public.profiles WHERE employee_id = 'EMP-801') WHERE name = 'Operations';

-- ────────────────────────────────────────────────────────────
-- ACTIVITY LOGS (sample entries)
-- ────────────────────────────────────────────────────────────
INSERT INTO public.activity_logs (actor_id, action, target_type, target_id, metadata, created_at) VALUES
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-101'), 'created',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-104'), '{"name":"Sneha Iyer"}',       now() - interval '90 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-101'), 'created',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-105'), '{"name":"Vikram Reddy"}',     now() - interval '85 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-601'), 'created',  'department',  'd0000001-0000-0000-0000-000000000001',                         '{"name":"Engineering"}',      now() - interval '120 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-601'), 'created',  'department',  'd0000001-0000-0000-0000-000000000005',                         '{"name":"Sales"}',            now() - interval '118 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-601'), 'created',  'designation', 'e0000001-0000-0000-0000-000000000001',                         '{"title":"Junior SWE"}',      now() - interval '115 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-101'), 'updated',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-108'), '{"field":"status","to":"on_leave"}', now() - interval '30 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-401'), 'created',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-409'), '{"name":"Reema Chadha"}',     now() - interval '20 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-501'), 'updated',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-515'), '{"field":"status","to":"inactive"}', now() - interval '15 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-701'), 'created',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-711'), '{"name":"Naresh Chitnis"}',   now() - interval '10 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-801'), 'created',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-812'), '{"name":"Mythili Anand"}',    now() - interval '5 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-201'), 'updated',  'department',  'd0000001-0000-0000-0000-000000000002',                         '{"field":"description"}',     now() - interval '3 days'),
  ((SELECT id FROM public.profiles WHERE employee_id = 'EMP-101'), 'created',  'employee',    (SELECT id FROM public.profiles WHERE employee_id = 'EMP-124'), '{"name":"Vidya Ranganathan"}',now() - interval '1 day');

-- ────────────────────────────────────────────────────────────
-- Update employee_id sequence to avoid conflicts
-- ────────────────────────────────────────────────────────────
SELECT setval('public.employee_id_seq', 900, true);

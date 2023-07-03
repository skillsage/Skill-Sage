part of skillsage_providers;

class UserProvider extends ChangeNotifier {
  final User _user = const User(
    id: 1,
    email: 'kulewoshienathan@gmail.com',
    name: 'Nathan Nunana',
    role: Role.jobSeeker,
    about:
        'A passionate and results-driven backend developer with 5 years of experience. I specialize in designing and implementing scalable and efficient server-side solutions that power modern web applications.',
    location: 'Kumasi, Ghana',
  );
  final List<Experience> _experiences = const [
    Experience(
      id: 1,
      companyName: "Fintech Inc.",
      jobTitle: "Software Developer",
      startDate: "Jan 2015",
      endDate: "Feb 2022",
      tasks: "",
    ),
    Experience(
      id: 2,
      companyName: "Hepeps Solutions.",
      jobTitle: "Mobile Application Developer",
      startDate: "Jan 2022",
      endDate: "Dec 2023",
      tasks: "",
    ),
  ];

  List<Skill> _skills = const [
    Skill(id: 1, name: 'Reactjs'),
    Skill(id: 2, name: 'Angular'),
    Skill(id: 3, name: 'MongoDB'),
    Skill(id: 4, name: 'Nodejs')
  ];

  final List<Language> _languages = const [
    Language(id: 1, name: 'English'),
    Language(id: 2, name: 'French'),
    Language(id: 3, name: 'Spanish'),
  ];

  get user => _user;
  get experiences => _experiences;
  get skills => _skills;
  set setSkills(arr) {
    _skills = arr;
    notifyListeners();
  }

  get languages => _languages;
}

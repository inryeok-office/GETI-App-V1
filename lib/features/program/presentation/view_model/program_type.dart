enum ProgramType { specialLecture, education }

extension ProgramTypeLabel on ProgramType {
  String get label => switch (this) {
    ProgramType.specialLecture => '특강',
    ProgramType.education => '교육',
  };
}

part of skillsage_utils;

final emailREgex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]{2,}(?:\.[a-zA-Z0-9-]+)*$");

final passwordREgex = RegExp(r"^[a-zA-Z0-9!@#$%^&*()_+\-={}|;:<>.?]{8,}$");

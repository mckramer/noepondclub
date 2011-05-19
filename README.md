== Noe Pond Club

1. http://www.noepondclub.org
* Legacy site
2. http://mck-noepond.heroku.com
* Development site (may be outdated version of this repository)


== Features

TBD

== Planning

=== Members
Types = { family, individual, senior, lifetime, junior, familyoftwo }
Independents = { mother, father }
* Link adult to their account as a child if legacy (add dummy dependent to use as legacy if old account has not been created)
Dependents = { kids => {name, dob, badges, participations} }

=== Employees
Types = { lifeguard, headlifeguard, office, tennis, swimming, diving, manager, maintanence, admin }, has_many :types (or :roles)

* Usernames: First initial + middle initial + last name
* Bios: picture, hometown, high school, college, bench press
* Link to child account if legacy
* Designate swimming instructors as a boolean column or as another type
* Batch define lesson times (allow to change lesson times or batch delete)

Swim lesson signup
1. Search by time or instructor
2. Choose timeslot
3. Choose dependent (or independent) and add optional notes
4. Done

Swim lesson generation batch
1. Choose instructor
2. Define date range to assign
3. Define times for 1 week
4. Done (check to ensure not creating more lessons on days where two exist; deal with half-day???)

Swim lesson review
1. Instructor talks to parent
2. Instructor checks off that he has spoken to parent
3. Office staff accept payment for lesson (check or cash)
4. Member receives confirmation email as receipt if desired

=== Teams
Youth swimming, diving, tennis
Events = { meet/match, practice, other(picnics) }
* RSVP to events
* RSVP for all kids at once or one-at-a-time
* Coaches can check attendence for each match/meet based on age group
* Coaches can sign kids up for teams
* Events exportable in iCal format
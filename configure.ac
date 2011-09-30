
AC_INIT(grappy, 2.0, grappy@lanclos.org, grappy, http://grappy.lanclos.org/)

AC_REVISION($Id: configure.ac,v 1.6 2011/02/19 18:11:41 lanclos Exp $)

AC_PREFIX_DEFAULT(/usr/local)

# We only perform simple autoconf operations. Not sure what the required
# version of autoconf is for proper operation.
# AC_PREREQ([2.59])


# Check --enable and --with directives.

AC_ARG_WITH([python],
	[AS_HELP_STRING([--with-python],
		[location of your python binary])],
	[],
	[with_python=no])

AS_IF([test "X$with_python" != "Xno"],
	AS_IF([test -x "$with_python"],
		AC_MSG_NOTICE([python binary set to $with_python]),
		AC_MSG_ERROR([--with-python specified with an invalid value]))
	[])


AC_ARG_WITH([psql],
	[AS_HELP_STRING([--with-psql],
		[location of your PostgreSQL command-line interpreter])],
	[],
	[with_psql=no])

AS_IF([test "X$with_psql" != "Xno"],
	AS_IF([test -x "$with_psql"],
		AC_MSG_NOTICE([psql binary set to $with_psql]),
		AC_MSG_ERROR([--with-psql specified with an invalid value]))
	[])


AC_ARG_WITH([mysql],
	[AS_HELP_STRING([--with-mysql],
		[location of your MySQL command-line interpreter])],
	[],
	[with_mysql=no])

AS_IF([test "X$with_mysql" != "Xno"],
	AS_IF([test -x "$with_mysql"],
		AC_MSG_NOTICE([mysql binary set to $with_mysql]),
		AC_MSG_ERROR([--with-mysql specified with an invalid value]))
	[])


AC_ARG_WITH([pid],
	[AS_HELP_STRING([--with-pid],
		[location for the runtime process-ID file (default: /tmp/grappy.pid)])],
	[],
	[with_pid=no])

AS_IF([test "X$with_pid" = "Xyes"],
	[with_pid=no],
	[])

AS_IF([test "X$with_pid" != "Xno"],
	AC_MSG_NOTICE([pid file set to $with_pid]),
	[with_pid=[/tmp/grappy.pid]])

PID=$with_pid


# Look for things.

AC_PROG_INSTALL
AC_PROG_SED

AS_IF([test "X$with_python" != "Xno"],
	[PYTHON="$with_python"],
	[AC_PATH_PROG(PYTHON, python, [not found])])

AS_IF([test "X$PYTHON" = "Xnot found"],
	AC_MSG_ERROR([grappy is written in python. You need a python interpreter.]))

AC_PATH_PROG([SH], [sh], [not found])
AS_IF([test "X$SH" = "Xnot found"],
	AC_MSG_ERROR([sh is required for delete-expired]))

# The next three checks are used for optional scripts. Their absence
# should not be considered a fatal configuration error.

AC_PATH_PROG([DIG], [dig], [not found])
AC_PATH_PROG([GREP], [grep], [not found])
AC_PATH_PROG([KILL], [kill], [not found])

AS_IF([test "X$with_psql" != "Xno"],
	[PSQL="$with_psql"],
	[AC_PATH_PROG(PSQL, psql, [not found])])

AS_IF([test "X$with_mysql" != "Xno"],
	[PSQL="$with_mysql"],
	[AC_PATH_PROG(MYSQL, mysql, [not found])])


AC_SUBST(DIG)
AC_SUBST(GREP)
AC_SUBST(KILL)
AC_SUBST(MYSQL)
AC_SUBST(PID)
AC_SUBST(PSQL)
AC_SUBST(PYTHON)
AC_SUBST(SH)

# Warn about not testing for backend-specific modules.

AC_MSG_WARN([no checks made for backend-specific modules, such as pgdb])

# List the files we are going to generate via config.status.

AC_CONFIG_FILES([Makefile])

# AC_OUTPUT must be the last step.

AC_OUTPUT

# EOF

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grade_conditions.R
\name{grade_conditions}
\alias{grade_conditions}
\title{Grade all specified conditions}
\usage{
grade_conditions(..., correct = NULL, incorrect = NULL,
  grader_args = list(), learnr_args = list(),
  glue_correct = getOption("gradethis_glue_correct_test"),
  glue_incorrect = getOption("gradethis_glue_incorrect_test"))
}
\arguments{
\item{...}{ignored}

\item{correct}{A character string to display if all tests pass. This
character string will be run through \link[glue:glue_data]{glue::glue_data} with:
\itemize{
\item \code{num_correct}: Number of correct tests. (Equals \code{num_total})
\item \code{num_total}: Number of tests
\item \code{errors}: Vector of errors found. (\code{NULL})
}}

\item{incorrect}{A character string to display if at least one test fails.
This character string will be run through \code{\link[glue:glue_data]{glue::glue_data()}} with:
\itemize{
\item \code{num_correct}: Number of correct tests
\item \code{num_total}: Number of tests
\item \code{errors}: Vector of errors found
}}

\item{grader_args}{A list of parameters passed to \code{grader} functions
(provided by \code{\link[=grade_learnr]{grade_learnr()}}). This contains:
\itemize{
\item \code{user_quo}: Quoted R code submitted by the user. For example
\code{\link[rlang:quo]{rlang::quo(1)}}
\item \code{solution_quo}: (Optional) Quoted solution R code provided by the
\code{*-solution} chunk for an exercise.
}}

\item{learnr_args}{A list of all parameters passed to \code{\link[=grade_learnr]{grade_learnr()}} by
\code{learnr}. See
\url{https://rstudio.github.io/learnr/exercises.html#exercise_checking} for
more details.}

\item{glue_correct}{A glue string that returns the final correct message
displayed. Defaults to \code{getOption("gradethis_glue_correct")}.}

\item{glue_incorrect}{A glue string that returns the final incorrect message
displayed. Defaults to \code{getOption("gradethis_glue_incorrect")}.}
}
\value{
a \code{grader_graded} structure from \code{\link[=graded]{graded()}} containing a formatted
\code{correct} or \code{incorrect} message.
}
\description{
Executes tests against the final result of the user code. If
a test throws an error, the test fails and the submitted answer will be
marked incorrect.
}
\details{
Executes tests against the final result of the user code. If
a test throws an error, the test fails and the submitted answer will be
marked incorrect.
}
\examples{
\dontrun{gradethis_demo()}

example_function <- function(x){
  return(x + 1)
}
grade_conditions(
  pass_if(~ .result(3) == 4),
  pass_if(~ .result(10) == 11),
  grader_args = list(),
  learnr_args = list(last_value = example_function, envir_prep = new.env())
)

grade_conditions(
  pass_if(~ .result(3) == 4),
  fail_if(~ .result(10) == 11),
  grader_args = list(),
  learnr_args = list(last_value = example_function, envir_prep = new.env())
)

}
\seealso{
\code{test}
}

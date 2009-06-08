#ifndef FOO_H
#define FOO_H
#ifdef __cplusplus
extern "C" {
#pragma }
#endif

/*! \fn void usage(char *name)
 * \brief Prints a usage summary for the program.
 *
 * If passed a null name it will exit with an program error,
 * also it will exit with a value of 1 no matter.
 * \param name The name of the program.
 */
void usage(char *name);

#ifdef __cplusplus
}
#endif
#endif /* FOO_H */

#import <substrate.h>

typedef void * xpc_object_t;

extern "C" bool xpc_dictionary_get_bool(xpc_object_t, const char *);
MSHook(bool, xpc_dictionary_get_bool, xpc_object_t dictionary, const char *key)
{
	if ((strcmp(key, "CFPreferencesAvoidCache") == 0) || (strcmp(key, "CFPreferencesShouldWriteSynchronously") == 0))
		return YES;
	return _xpc_dictionary_get_bool(dictionary, key);
}

%ctor
{
	MSHookFunction(xpc_dictionary_get_bool, MSHake(xpc_dictionary_get_bool));
}
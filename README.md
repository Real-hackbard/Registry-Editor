# Registry-Editor:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![Registry Editor](https://github.com/user-attachments/assets/7608f97d-9f5d-4381-9e92-00409c717921)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![112025](https://github.com/user-attachments/assets/6c049038-ad2c-4fe3-9b7e-1ca8154910c2)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>


The Windows Registry is a [hierarchical database](https://en.wikipedia.org/wiki/Hierarchical_database_model) that stores [low-level](https://en.wikipedia.org/wiki/High-_and_low-level) settings for the Microsoft Windows operating system and for applications that opt to use the registry. The [kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system)), [device drivers](https://en.wikipedia.org/wiki/Device_driver), [services](https://en.wikipedia.org/wiki/Windows_service), [Security Accounts Manager](https://en.wikipedia.org/wiki/Security_Account_Manager), and [user interfaces](https://en.wikipedia.org/wiki/Graphical_user_interface) can all use the registry. The registry also allows access to [counters](https://en.wikipedia.org/wiki/Instrumentation_(computer_programming)) for profiling system performance.

In other words, the registry or Windows Registry contains information, settings, options, and other values for programs and hardware installed on all versions of Microsoft Windows operating systems. For example, when a program is installed, a new subkey containing settings such as a program's location, its version, and how to start the program, are all added to the Windows Registry.

</br>

![Registry Editor](https://github.com/user-attachments/assets/8a33a3a9-59f2-4a96-964c-057918c16fbd)

</br>

# Structure of Registry Key:
The registry contains two basic elements: keys and values. Registry keys are container objects similar to folders. Registry values are non-container objects similar to files. Keys may contain values and subkeys. Keys are referenced with a syntax similar to Windows' path names, using backslashes to indicate levels of hierarchy. Keys must have a [case insensitive](https://en.wikipedia.org/wiki/Case_sensitivity) name without backslashes.

The hierarchy of registry keys can only be accessed from a known root key handle (which is anonymous but whose effective value is a constant numeric handle) that is mapped to the content of a registry key preloaded by the kernel from a stored "hive", or to the content of a subkey within another root key, or mapped to a registered service or DLL that provides access to its contained subkeys and values.

There are seven predefined root keys, traditionally named according to their constant handles defined in the Win32 API, or by synonymous abbreviations (depending on applications):

* ```HKEY_LOCAL_MACHINE```    or ```HKLM```
* ```HKEY_CURRENT_CONFIG```   or ```HKCC```
* ```HKEY_CLASSES_ROOT```     or ```HKCR```
* ```HKEY_CURRENT_USER```     or ```HKCU```
* ```HKEY_USERS```            or ```HKU```
* ```HKEY_PERFORMANCE_DATA``` (only in Windows NT, but invisible in the Windows Registry Editor)
* ```HKEY_DYN_DATA```         (only in Windows 9x, and visible in the Windows Registry Editor)

Like other files and services in Windows, all registry keys may be restricted by [access control](https://en.wikipedia.org/wiki/Access-control_list) lists (ACLs), depending on user privileges, or on security tokens acquired by applications, or on system security policies enforced by the system (these restrictions may be predefined by the system itself, and configured by local system administrators or by domain administrators). Different users, programs, services or remote systems may only see some parts of the hierarchy or distinct hierarchies from the same root keys.

Registry values are name/data pairs stored within keys. Registry values are referenced separately from registry keys. Each registry value stored in a registry key has a unique name whose letter case is not significant. The [Windows API](https://en.wikipedia.org/wiki/Windows_API) functions that query and manipulate registry values take value names separately from the key path or handle that identifies the parent key. Registry values may contain backslashes in their names, but doing so makes them difficult to distinguish from their key paths when using some legacy Windows Registry API functions (whose usage is deprecated in Win32).


| Handle             | Description   | 
| :----------------  | :-----------  | 
| [HKEY_CLASSES_ROOT](https://learn.microsoft.com/en-us/windows/win32/sysinfo/hkey-classes-root-key)     | Registry entries subordinate to this key define types (or classes) of documents and the properties associated with those types. Shell and COM applications use the information stored under this key. This key also provides backward compatibility with the Windows 3.1 registration database by storing information for DDE and OLE support. File viewers and user interface extensions store their OLE class identifiers in HKEY_CLASSES_ROOT, and in-process servers are registered in this key. This handle should not be used in a service or an application that impersonates different users. For more information, see HKEY_CLASSES_ROOT.     | 
| [HKEY_CURRENT_CONFIG](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc776168(v=ws.10))   | Contains information about the current hardware profile of the local computer system. The information under HKEY_CURRENT_CONFIG describes only the differences between the current hardware configuration and the standard configuration. Information about the standard hardware configuration is stored under the Software and System keys of HKEY_LOCAL_MACHINE. HKEY_CURRENT_CONFIG is an alias for ```HKEY_LOCAL_MACHINE\System\CurrentControlSet\Hardware Profiles\Current```. For more information, see HKEY_CURRENT_CONFIG. | 
| [HKEY_CURRENT_USER](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc779816(v=ws.10))     | Registry entries subordinate to this key define the preferences of the current user. These preferences include the settings of environment variables, data about program groups, colors, printers, network connections, and application preferences. This key makes it easier to establish the current user's settings; the key maps to the current user's branch in HKEY_USERS. In HKEY_CURRENT_USER, software vendors store the current user-specific preferences to be used within their applications. Microsoft, for example, creates the HKEY_CURRENT_USER\Software\Microsoft key for its applications to use, with each application creating its own subkey under the Microsoft key. The mapping between HKEY_CURRENT_USER and HKEY_USERS is per process and is established the first time the process references HKEY_CURRENT_USER. The mapping is based on the security context of the first thread to reference HKEY_CURRENT_USER. If this security context does not have a registry hive loaded in HKEY_USERS, the mapping is established with HKEY_USERS\.Default. After this mapping is established it persists, even if the security context of the thread changes. All registry entries in HKEY_CURRENT_USER except those under HKEY_CURRENT_USER\Software\Classes are included in the per-user registry portion of a roaming user profile. To exclude other entries from a roaming user profile, store them in HKEY_CURRENT_USER_LOCAL_SETTINGS. This handle should not be used in a service or an application that impersonates different users. Instead, call the RegOpenCurrentUser function. For more information, see HKEY_CURRENT_USER. |
| HKEY_CURRENT_USER_LOCAL_SETTINGS | Registry entries subordinate to this key define preferences of the current user that are local to the machine. These entries are not included in the per-user registry portion of a roaming user profile. Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP/2000: This key is supported starting with Windows 7 and Windows Server 2008 R2. | 
| [HKEY_LOCAL_MACHINE](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc784983(v=ws.10)) | Registry entries subordinate to this key define the physical state of the computer, including data about the bus type, system memory, and installed hardware and software. It contains subkeys that hold current configuration data, including Plug and Play information (the Enum branch, which includes a complete list of all hardware that has ever been on the system), network logon preferences, network security information, software-related information (such as server names and the location of the server), and other system information. For more information, see HKEY_LOCAL_MACHINE.  | 
| HKEY_PERFORMANCE_DATA | Registry entries subordinate to this key allow you to access performance data. The data is not actually stored in the registry; the registry functions cause the system to collect the data from its source. | 
| HKEY_PERFORMANCE_NLSTEXT | Registry entries subordinate to this key reference the text strings that describe counters in the local language of the area in which the computer system is running. These entries are not available to Regedit.exe and Regedt32.exe.Windows 2000: This key is not supported. | 
| HKEY_PERFORMANCE_TEXT | Registry entries subordinate to this key reference the text strings that describe counters in US English. These entries are not available to Regedit.exe and Regedt32.exe.Windows 2000: This key is not supported. | 
| HKEY_USERS     | Registry entries subordinate to this key define the default user configuration for new users on the local computer and the user configuration for the current user.  | 

</br>


# .REG files:
.REG files (also known as Registration entries) are text-based human-readable files for exporting and importing portions of the registry using an INI-based syntax. There are two main versions of REG files:
* Windows 9x and NT 4.0 REG files are ANSI-based. They start with the string REGEDIT4.[26]
* Windows 2000 and later REG files are Unicode-based. They start with the string Windows Registry Editor Version 5.00.
Windows 9x format .REG files can be imported by Windows 2000 and later.[26] These later systems also allow exporting .REG files in Windows 9x/NT format.

Data is stored in .REG files using the following syntax:
```pascal
[<Hive name>\<Key name>\<Subkey name>]
"Value name"=<Value type>:<Value data>
```
The Default Value of a key can be edited by using @ instead of "Value Name":

```pascal
[<Hive name>\<Key name>\<Subkey name>]
@=<Value type>:<Value data>
```
String values do not require a <Value type> (see example), but backslashes (\) need to be written as a double-backslash (\\), and quotes (") as backslash-quote (\"). (The requirement for escaping is not totally consistent: files containing strings with unescaped leading backslash do exist and are accepted by the system for importing.)

# Privilegs:
"Registry privilege" refers to privileges in a Windows operating system. These are special rights assigned to a user account or process that control access to certain system resources and tasks. Examples include the right to back up files (SeBackupPrivilege) or to change the system time.

```pascal
  SE_CREATE_TOKEN_NAME = 'SeCreateTokenPrivilege';
  SE_ASSIGNPRIMARYTOKEN_NAME = 'SeAssignPrimaryTokenPrivilege';
  SE_LOCK_MEMORY_NAME = 'SeLockMemoryPrivilege';
  SE_INCREASE_QUOTA_NAME = 'SeIncreaseQuotaPrivilege';
  SE_UNSOLICITED_INPUT_NAME = 'SeUnsolicitedInputPrivilege';
  SE_MACHINE_ACCOUNT_NAME = 'SeMachineAccountPrivilege';
  SE_TCB_NAME = 'SeTcbPrivilege';
  SE_SECURITY_NAME = 'SeSecurityPrivilege';
  SE_TAKE_OWNERSHIP_NAME = 'SeTakeOwnershipPrivilege';
  SE_LOAD_DRIVER_NAME = 'SeLoadDriverPrivilege';
  SE_SYSTEM_PROFILE_NAME = 'SeSystemProfilePrivilege';
  SE_SYSTEMTIME_NAME = 'SeSystemtimePrivilege';
  SE_PROF_SINGLE_PROCESS_NAME = 'SeProfileSingleProcessPrivilege';
  SE_INC_BASE_PRIORITY_NAME = 'SeIncreaseBasePriorityPrivilege';
  SE_CREATE_PAGEFILE_NAME = 'SeCreatePagefilePrivilege';
  SE_CREATE_PERMANENT_NAME = 'SeCreatePermanentPrivilege';
  SE_BACKUP_NAME = 'SeBackupPrivilege';
  SE_RESTORE_NAME = 'SeRestorePrivilege';
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
  SE_DEBUG_NAME = 'SeDebugPrivilege';
  SE_AUDIT_NAME = 'SeAuditPrivilege';
  SE_SYSTEM_ENVIRONMENT_NAME = 'SeSystemEnvironmentPrivilege';
  SE_CHANGE_NOTIFY_NAME = 'SeChangeNotifyPrivilege';
  SE_REMOTE_SHUTDOWN_NAME = 'SeRemoteShutdownPrivilege';
  SE_UNDOCK_NAME = 'SeUndockPrivilege';
  SE_SYNC_AGENT_NAME = 'SeSyncAgentPrivilege';
  SE_ENABLE_DELEGATION_NAME = 'SeEnableDelegationPrivilege';
  SE_MANAGE_VOLUME_NAME = 'SeManageVolumePrivilege';
```

# t_store


## Getting Started

### Commands 
`dart fix --apply`
Generate Key
`keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android`


* What went wrong:
  Execution failed for task ':app:mergeExtDexDebug'.
> A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingTaskDelegate
> There was a failure while executing work items
> A failure occurred while executing com.android.build.gradle.internal.tasks.DexMergingWorkAction
> com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
The number of method references in a .dex file cannot exceed 64K.
> 
> BUILD FAILED in 4m 15s
[!] App requires Multidex support
Multidex support is required for your android app to build since the number of methods has exceeded 64k. See https://docs.flutter.dev/deployment/android#enabling-multidex-support for more information. You may pass the --no-multidex flag to skip Flutter's multidex support to use a manual solution.

    Flutter tool can add multidex support. The following file will be added by flutter:

SOLUTION: Run this command `fvm flutter run --multidex`

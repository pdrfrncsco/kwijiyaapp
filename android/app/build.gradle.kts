import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
val hasReleaseKeystore = keystorePropertiesFile.exists()
if (hasReleaseKeystore) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.ndeascloud.kwijiya"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.14206865" // flutter.ndkVersion
    // buildDir = file("D:/ndeascloud/kwijiya/kwijiyaapp/build/app")

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.ndeascloud.kwijiya"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (hasReleaseKeystore) {
            create("release") {
                val keyAliasProp = keystoreProperties["keyAlias"] as String?
                val keyPasswordProp = keystoreProperties["keyPassword"] as String?
                val storeFileProp = keystoreProperties["storeFile"] as String?
                val storePasswordProp = keystoreProperties["storePassword"] as String?

                keyAlias = keyAliasProp
                keyPassword = keyPasswordProp
                storeFile = storeFileProp?.let { file(it) }
                storePassword = storePasswordProp
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (hasReleaseKeystore) {
                signingConfigs.getByName("release")
            } else {
                // Fallback para debug keystore se ainda não existir key.properties
                signingConfigs.getByName("debug")
            }
            proguardFiles(
                    getDefaultProguardFile("proguard-android-optimize.txt"),
                    "proguard-rules.pro"
                )
        }
    }
}
flutter {
    source = "../.."
}

configurations.all {
    resolutionStrategy {
        force("androidx.browser:browser:1.8.0")
        force("androidx.core:core-ktx:1.13.1")
        force("androidx.core:core:1.13.1")
    }
}

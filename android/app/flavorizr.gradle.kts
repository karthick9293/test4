import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("casmex") {
            dimension = "flavor-type"
            applicationId = "com.dis.casmex"
            resValue(type = "string", name = "app_name", value = "Casmex")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "casmex",
                "DEEPLINK_SCHEME_2" to "casmexDoc",
                "DEEPLINK_SCHEME_3" to "casmexDash"
            )
        }
        create("lmpay") {
            dimension = "flavor-type"
            applicationId = "com.user.lm_pay"
            resValue(type = "string", name = "app_name", value = "LMPAY")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "lmpay",
                "DEEPLINK_SCHEME_2" to "lmpayDoc",
                "DEEPLINK_SCHEME_3" to "lmpayDash"
            )
        }
        create("globalexchange") {
            dimension = "flavor-type"
            applicationId = "com.dis.globalexchange"
            resValue(type = "string", name = "app_name", value = "Global Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "globalexchange",
                "DEEPLINK_SCHEME_2" to "globalexchangeDoc",
                "DEEPLINK_SCHEME_3" to "globalexchangeDash"
            )
        }
        create("cityexchangeuae") {
            dimension = "flavor-type"
            applicationId = "com.dis.cityexchangeuae"
            resValue(type = "string", name = "app_name", value = "City Exchange UAE")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "cityexchangeuae",
                "DEEPLINK_SCHEME_2" to "cityexchangeuaeDoc",
                "DEEPLINK_SCHEME_3" to "cityexchangeuaeDash"
            )
        }
        create("lakhoos") {
            dimension = "flavor-type"
            applicationId = "com.dis.lakhoos"
            resValue(type = "string", name = "app_name", value = "Lakhoos")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "lakhoos",
                "DEEPLINK_SCHEME_2" to "lakhoosDoc",
                "DEEPLINK_SCHEME_3" to "lakhoosDash"
            )
        }
        create("kabayanRemit") {
            dimension = "flavor-type"
            applicationId = "com.dis.kabayanremit"
            resValue(type = "string", name = "app_name", value = "Kabayan Remit")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "kabayanremit",
                "DEEPLINK_SCHEME_2" to "kabayanremitDoc",
                "DEEPLINK_SCHEME_3" to "kabayanremitDash"
            )
        }
        create("dohaexchange") {
            dimension = "flavor-type"
            applicationId = "com.nagainfo.dohaexchange"
            resValue(type = "string", name = "app_name", value = "Doha Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "kabayanremit",
                "DEEPLINK_SCHEME_2" to "kabayanremitDoc",
                "DEEPLINK_SCHEME_3" to "kabayanremitDash"
            )
        }
        create("cityexchange") {
            dimension = "flavor-type"
            applicationId = "com.nagainfo.cityexchange"
            resValue(type = "string", name = "app_name", value = "City Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "cityexchange",
                "DEEPLINK_SCHEME_2" to "cityexchangeDoc",
                "DEEPLINK_SCHEME_3" to "cityexchangeDash"
            )
        }
        create("royalgrowth") {
            dimension = "flavor-type"
            applicationId = "com.dis.royal_growth"
            resValue(type = "string", name = "app_name", value = "Royal Growth")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "royalgrowth",
                "DEEPLINK_SCHEME_2" to "royalgrowthDoc",
                "DEEPLINK_SCHEME_3" to "royalgrowthDash"
            )
        }
        create("sharafexchange") {
            dimension = "flavor-type"
            applicationId = "com.dis.sharafexchange"
            resValue(type = "string", name = "app_name", value = "Sharaf Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "sharafexchange",
                "DEEPLINK_SCHEME_2" to "sharafexchangeDoc",
                "DEEPLINK_SCHEME_3" to "sharafexchangeDash"
            )
        }
        create("unimonioman") {
            dimension = "flavor-type"
            applicationId = "com.unimonioman"
            resValue(type = "string", name = "app_name", value = "Unimoni Oman")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "unimonioman",
                "DEEPLINK_SCHEME_2" to "unimoniomanDoc",
                "DEEPLINK_SCHEME_3" to "unimoniomanDash"
            )
        }
        create("aljazeeraexchangeqatar") {
            dimension = "flavor-type"
            applicationId = "com.dis.aljazeeraexchange"
            resValue(type = "string", name = "app_name", value = "Al Jazeera Exchange Qatar")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "aljazeeraexchangeqatar",
                "DEEPLINK_SCHEME_2" to "aljazeeraexchangeqatarDoc",
                "DEEPLINK_SCHEME_3" to "aljazeeraexchangeqatarDash"
            )
        }
        create("hamdanexchange") {
            dimension = "flavor-type"
            applicationId = "io.thoughtbox.hamdan"
            resValue(type = "string", name = "app_name", value = "HamdanPay")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "hamdanexchange",
                "DEEPLINK_SCHEME_2" to "hamdanexchangeDoc",
                "DEEPLINK_SCHEME_3" to "hamdanexchangeDash"
            )
        }
        create("alJadeed") {
            dimension = "flavor-type"
            applicationId = "io.thoughtbox.jadeed"
            resValue(type = "string", name = "app_name", value = "Al Jadeed")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "alJadeed",
                "DEEPLINK_SCHEME_2" to "alJadeedDoc",
                "DEEPLINK_SCHEME_3" to "alJadeedDash"
            )
        }
        create("omanexchange") {
            dimension = "flavor-type"
            applicationId = "com.dis.omanexchange"
            resValue(type = "string", name = "app_name", value = "Oman Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "omanexchange",
                "DEEPLINK_SCHEME_2" to "omanexchangeDoc",
                "DEEPLINK_SCHEME_3" to "omanexchangeDash"
            )
        }
        create("alsaddexchange") {
            dimension = "flavor-type"
            applicationId = "com.alsadd.moneyexchange"
            resValue(type = "string", name = "app_name", value = "Alsadd Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "alsaddexchange",
                "DEEPLINK_SCHEME_2" to "alsaddexchangeDoc",
                "DEEPLINK_SCHEME_3" to "alsaddexchangeDash"
            )
        }
        create("kiecoexchange") {
            dimension = "flavor-type"
            applicationId = "com.kuwaitindiaexchange"
            resValue(type = "string", name = "app_name", value = "KIECO Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "kiecoexchange",
                "DEEPLINK_SCHEME_2" to "kiecoexchangeDoc",
                "DEEPLINK_SCHEME_3" to "kiecoexchangeDash"
            )
        }
        create("easternexchange") {
            dimension = "flavor-type"
            applicationId = "com.eastern.moneyexchange"
            resValue(type = "string", name = "app_name", value = "Eastern Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "easternexchange",
                "DEEPLINK_SCHEME_2" to "easternexchangeDoc",
                "DEEPLINK_SCHEME_3" to "easternexchangeDash"
            )
        }
        create("alzamanexchange") {
            dimension = "flavor-type"
            applicationId = "com.nagainfo.alzaman"
            resValue(type = "string", name = "app_name", value = "Alzaman Exchange")
            manifestPlaceholders += mapOf(
                "DEEPLINK_SCHEME_1" to "alzamanexchange",
                "DEEPLINK_SCHEME_2" to "alzamanexchangeDoc",
                "DEEPLINK_SCHEME_3" to "alzamanexchangeDash"
            )
        }
    }
}
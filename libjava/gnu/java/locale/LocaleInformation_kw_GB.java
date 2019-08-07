// This file was automatically generated by localedef.

package gnu.java.locale;

import java.util.ListResourceBundle;

public class LocaleInformation_kw_GB extends ListResourceBundle
{
  static final String decimalSeparator = ".";
  static final String groupingSeparator = ",";
  static final String numberFormat = "#,###,##0.###";
  static final String percentFormat = "#,###,##0%";
  static final String[] weekdays = { null, "De Sul", "De Lun", "De Merth", "De Merher", "De Yow", "De Gwener", "De Sadorn" };

  static final String[] shortWeekdays = { null, "Sul", "Lun", "Mth", "Mhr", "Yow", "Gwe", "Sad" };

  static final String[] shortMonths = { "Gen", "Whe>", "Mer", "Ebr", "Me", "Evn", "Gor", "Est", "Gwn", "Hed", "Du", "Kev", null };

  static final String[] months = { "Mys Genver", "Mys Whevrel", "Mys Merth", "Mys Ebrel", "Mys Me", "Mys Evan", "Mys Gortheren", "Mye Est", "Mys Gwyngala", "Mys Hedra", "Mys Du", "Mys Kevardhu", null };

  static final String[] ampms = { "", "" };

  static final String shortDateFormat = "dd/MM/yy";
  static final String defaultTimeFormat = "";
  static final String currencySymbol = "\u00A3";
  static final String intlCurrencySymbol = "GBP";
  static final String currencyFormat = "$#,###,##0.00;-$#,###,##0.00";

  private static final Object[][] contents =
  {
    { "weekdays", weekdays },
    { "shortWeekdays", shortWeekdays },
    { "shortMonths", shortMonths },
    { "months", months },
    { "ampms", ampms },
    { "shortDateFormat", shortDateFormat },
    { "defaultTimeFormat", defaultTimeFormat },
    { "currencySymbol", currencySymbol },
    { "intlCurrencySymbol", intlCurrencySymbol },
    { "currencyFormat", currencyFormat },
    { "decimalSeparator", decimalSeparator },
    { "groupingSeparator", groupingSeparator },
    { "numberFormat", numberFormat },
    { "percentFormat", percentFormat },
  };

  public Object[][] getContents () { return contents; }
}
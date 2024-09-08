package _11106
{
   import _11111._11110;
   import _1529._1528;
   
   public class _12897 extends _11107
   {
      public static const LearnDB:String = "LearnDB";
      
      public static const OfficialVideo:String = "OfficialVideo";
      
      public static const OnlineDoc:String = "OnlineDoc";
      
      public static const APIDoc:String = "APIDoc";
      
      public static const NewFeature:String = "NewFeature";
      
      public static const OfficialWebsite:String = "OfficialWebsite";
      
      public static const GitHub:String = "GitHub";
      
      public static const VideoCenter:String = "VideoCenter";
      
      public static const IdeaCollection:String = "IdeaCollection";
      
      public static const BBS:String = "BBS";
      
      public static const EgretStore:String = "EgretStore";
      
      public static const LearnPaid:String = "LearnPaid";
      
      public static const PaidAgreement:String = "PaidAgreement";
      
      public function _12897()
      {
         super(_11109.OutURL);
      }
      
      override public function _11130(param1:String) : void
      {
         super._11130(param1);
         this._11132();
      }
      
      override public function _11132() : void
      {
         _11110.instance.trackEvent(_11109.Action,_11109.OutURL,_11163);
         _11110.instance.trackEvent(_11109.OutURL,_name,_1528.language);
      }
      
      public function _13259(param1:String, param2:String) : void
      {
         init(param1);
         this._11130(param2);
      }
   }
}


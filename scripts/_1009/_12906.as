package _1009
{
   import _1033._12914;
   import _1045._1105;
   import _1374.Window;
   import _1529._1528;
   import _1529._1530;
   
   public class _12906 extends Window
   {
      public const ZH_SRC:String = "/assets/skins/pay/deauthorize_cn.png";
      
      public const EN_SRC:String = "/assets/skins/pay/deauthorize_en.png";
      
      public var background:_1105;
      
      private var _13034:String;
      
      public function _12906()
      {
         super();
         this.skinName = _12914;
         if(_1528.language == _1530.zh_CN)
         {
            this._13034 = this.ZH_SRC;
         }
         else
         {
            this._13034 = this.EN_SRC;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.background.source = this._13034;
         this.invalidateDisplayList();
      }
   }
}


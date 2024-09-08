package
{
   import _11111._11110;
   import _11111._11112;
   import _1404._1407;
   import _1435._1434;
   import _1529._1528;
   import _1529._1530;
   import _2._1;
   import _472._471;
   import _521._527;
   import _521._528;
   import _639._642;
   import egret.core._1112;
   import egret.managers._1220;
   import egret.utils.SystemInfo;
   import egret.utils.app.bridge._1500;
   import flash.events.Event;
   
   public class DragonBonesPro extends _1220
   {
      private var _7394:Class;
      
      private var _7392:Class;
      
      private var _7391:_1434;
      
      private var _7393:_1;
      
      public function DragonBonesPro()
      {
         this._7394 = DragonBonesPro__7394;
         this._7392 = DragonBonesPro__7392;
         super();
         _1528.init(_1528.LANGUAGE_CONFIG);
         this._12895();
         if(SystemInfo.isMacOS)
         {
            _1112.fontFamily = "Lucida Grande";
         }
         else if(_1528.language == _1530.zh_CN)
         {
            _1112.fontFamily = "SimSun";
         }
         else
         {
            _1112.fontFamily = "Arial";
         }
         _1112.size = 12;
         _1112.textColor = 16711422;
         this.visible = false;
         _1500.load(this._7389);
         this._7391 = new _1434(this._7394,this._7392);
         this._7391.activate();
      }
      
      private function _12895() : void
      {
         _642.getInstance().initialize();
         _642.getInstance()._1664();
         var _loc1_:String = _642.getInstance().language;
         if(Boolean(_loc1_) && (_loc1_ == _1530.zh_CN || _loc1_ == _1530.en_US || _loc1_ == _1530.ru_RF))
         {
            _1528._12894(_loc1_);
         }
      }
      
      private function _7389(param1:Boolean) : void
      {
         this._7393 = new _1(this);
         this._7393.addEventListener(Event.COMPLETE,this._7388);
         this._7393.addEventListener("uncaughtError",this.onUncaughtError);
         this._7393.start();
      }
      
      private function onUncaughtError(param1:Event) : void
      {
         this._2210._11135();
      }
      
      private function _7388(param1:Event) : void
      {
         this.visible = true;
         this.stage.nativeWindow.visible = true;
         this._7391.close();
         _527.getInstance()._2592();
         _528._14515();
         _11110.instance._11167(_11112.Splash);
      }
      
      protected function get _2210() : _471
      {
         return _1407.getInstance(_471) as _471;
      }
   }
}


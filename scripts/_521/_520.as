package _521
{
   import _1374.Alert;
   import _6._7;
   import egret.core._1135;
   import flash.utils.Dictionary;
   
   public class _520 extends _7
   {
      private var _1849:Dictionary;
      
      public function _520()
      {
         this._1849 = new Dictionary();
         super();
      }
      
      public function _3301(param1:String = "", param2:String = "", param3:_1135 = null, param4:Function = null, param5:String = "Alert.Confirm", param6:String = "", param7:String = "", param8:Boolean = true, param9:Number = NaN) : void
      {
         if(this._1849.hasOwnProperty(param1))
         {
            return;
         }
         this._1849[param1] = true;
         Alert.show(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function _3302(param1:String) : void
      {
         if(this._1849.hasOwnProperty(param1))
         {
            delete this._1849[param1];
         }
      }
   }
}


package _1146
{
   import _1148._1150;
   import _1162._1163;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class Scale extends _1147
   {
      public var _8903:Number;
      
      public var _8908:Number;
      
      public var _8907:Number;
      
      public var _8904:Number;
      
      public var _8906:Number;
      
      public var _8905:Number;
      
      public function Scale(param1:Object = null)
      {
         super(param1);
         _8757 = _1163;
      }
      
      override public function _8777(param1:Object = null) : _1172
      {
         motionPaths = new Vector.<_1150>();
         return super._8777(param1);
      }
      
      override protected function _8760(param1:_1172) : void
      {
         ns_egret::_8778("scaleX",this._8904,this._8906,this._8905);
         ns_egret::_8778("scaleY",this._8903,this._8908,this._8907);
         super._8760(param1);
      }
   }
}


package _1146
{
   import _1148._1150;
   import _1162._1163;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class Move extends _1147
   {
      public var _8899:Number;
      
      public var _8896:Number;
      
      public var _5460:Number;
      
      public var _8897:Number;
      
      public var _8762:Number;
      
      public var _8898:Number;
      
      public function Move(param1:Object = null)
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
         ns_egret::_8778("translationX",this._8762,this._8898,this._8897);
         ns_egret::_8778("translationY",this._8896,this._5460,this._8899);
         super._8760(param1);
      }
   }
}


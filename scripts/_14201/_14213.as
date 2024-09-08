package _14201
{
   import _14193._14194;
   import _14193._14196;
   import _14193._14197;
   import _14240._14246;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class _14213 extends _14196 implements _14194
   {
      public var _15196:String;
      
      public var _15197:String;
      
      public var _15195:String;
      
      public var _15194:String;
      
      public var patternTransform:String;
      
      public function _14213()
      {
         super("pattern");
      }
      
      public function get _15190() : Rectangle
      {
         return _1699("viewBox") as Rectangle;
      }
      
      public function set _15190(param1:Rectangle) : void
      {
         _15253("viewBox",param1);
      }
      
      public function _5907() : BitmapData
      {
         content.scaleX = content.scaleY = 1;
         var _loc1_:Number = 0;
         if(this._15196)
         {
            _loc1_ = _15258(this._15196,_14246.WIDTH);
         }
         var _loc2_:Number = 0;
         if(this._15197)
         {
            _loc2_ = _15258(this._15197,_14246.HEIGHT);
         }
         var _loc3_:Number = 0;
         if(this._15195)
         {
            _loc3_ = _15258(this._15195,_14246.WIDTH);
         }
         var _loc4_:Number = 0;
         if(this._15194)
         {
            _loc4_ = _15258(this._15194,_14246.HEIGHT);
         }
         content.scaleX = _loc3_ / content.width;
         content.scaleY = _loc4_ / content.height;
         if(_loc3_ == 0 || _loc4_ == 0)
         {
            return null;
         }
         var _loc5_:BitmapData = new BitmapData(_loc3_,_loc4_);
         _loc5_.draw(this,null,null,null,null,true);
         return _loc5_;
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14213 = super.clone(param1) as _14213;
         _loc2_._15196 = this._15196;
         _loc2_._15197 = this._15197;
         _loc2_._15195 = this._15195;
         _loc2_._15194 = this._15194;
         _loc2_.patternTransform = this.patternTransform;
         return _loc2_;
      }
   }
}


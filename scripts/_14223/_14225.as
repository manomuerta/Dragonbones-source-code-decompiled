package _14223
{
   import _14240.Bezier;
   import _14240._14239;
   import _14240._14243;
   import flash.display.GraphicsPathCommand;
   import flash.geom.Point;
   
   public class _14225 implements _14226
   {
      public var commands:Vector.<int>;
      
      public var pathData:Vector.<Number>;
      
      private var _15431:Number = 0;
      
      private var _15430:Number = 0;
      
      public function _14225()
      {
         super();
         this.commands = new Vector.<int>();
         this.pathData = new Vector.<Number>();
      }
      
      public function get _15425() : Number
      {
         return this._15431;
      }
      
      public function get _15426() : Number
      {
         return this._15430;
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         this.commands.push(GraphicsPathCommand.MOVE_TO);
         this.pathData.push(param1,param2);
         this._15431 = param1;
         this._15430 = param2;
      }
      
      public function lineTo(param1:Number, param2:Number) : void
      {
         this.commands.push(GraphicsPathCommand.LINE_TO);
         this.pathData.push(param1,param2);
         this._15431 = param1;
         this._15430 = param2;
      }
      
      public function curveTo(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.commands.push(GraphicsPathCommand.CURVE_TO);
         this.pathData.push(param1,param2,param3,param4);
         this._15431 = param3;
         this._15430 = param4;
      }
      
      public function cubicCurveTo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Point = null;
         var _loc10_:Point = null;
         var _loc11_:Bezier = null;
         var _loc12_:Object = null;
         if(_14243._15428)
         {
            this.commands.push(GraphicsPathCommand["CUBIC_CURVE_TO"]);
            this.pathData.push(param1,param2,param3,param4,param5,param6);
            this._15431 = param5;
            this._15430 = param6;
         }
         else
         {
            _loc7_ = new Point(this._15431,this._15430);
            _loc8_ = new Point(param1,param2);
            _loc9_ = new Point(param3,param4);
            _loc10_ = new Point(param5,param6);
            _loc11_ = new Bezier(_loc7_,_loc8_,_loc9_,_loc10_);
            for each(_loc12_ in _loc11_._15427)
            {
               this.curveTo(_loc12_.c.x,_loc12_.c.y,_loc12_.p.x,_loc12_.p.y);
            }
         }
      }
      
      public function _15324(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean, param6:Number, param7:Number) : void
      {
         var _loc8_:Object = _14239._15412(param1,param2,param3,param4,param5,param6,param7,this._15431,this._15430);
         var _loc9_:Array = _14239._15410(_loc8_.cx,_loc8_.cy,_loc8_.startAngle,_loc8_.arc,_loc8_.radius,_loc8_.yRadius,_loc8_._15176);
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_.length)
         {
            this.curveTo(_loc9_[_loc10_].c.x,_loc9_[_loc10_].c.y,_loc9_[_loc10_].p.x,_loc9_[_loc10_].p.y);
            _loc10_++;
         }
      }
   }
}


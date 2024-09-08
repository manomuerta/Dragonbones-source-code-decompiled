package _1376
{
   import flash.events.EventDispatcher;
   
   public class BoxElement extends EventDispatcher implements _1380
   {
      public var _separator:_1381;
      
      private var _9578:int = -1;
      
      private var _9580:_1379;
      
      private var _9569:Boolean = true;
      
      private var _9577:Boolean = false;
      
      private var _9576:Number = 0.5;
      
      private var _9573:_1379;
      
      private var _9572:_1379;
      
      private var _9579:_1380;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _8684:Number = NaN;
      
      private var _width:Number = 0;
      
      private var _8682:Number = NaN;
      
      private var _height:Number = 0;
      
      private var _9574:Number = 265;
      
      private var _9571:Number = 250;
      
      public function BoxElement(param1:Boolean = false)
      {
         super();
         this._9577 = param1;
         this._separator = new _1381();
         this._separator.target = this;
      }
      
      public function get separator() : _1381
      {
         return this._separator;
      }
      
      public function get _2250() : int
      {
         return this._9578;
      }
      
      public function set _2250(param1:int) : void
      {
         this._9578 = param1;
      }
      
      public function get _9581() : _1379
      {
         return this._9580;
      }
      
      public function set _9581(param1:_1379) : void
      {
         this._9580 = param1;
      }
      
      public function get _9570() : Boolean
      {
         return this._9569;
      }
      
      public function set _9570(param1:Boolean) : void
      {
         this._9569 = param1;
      }
      
      public function get isVertical() : Boolean
      {
         return this._9577;
      }
      
      public function set isVertical(param1:Boolean) : void
      {
         this._9577 = param1;
      }
      
      public function get percentSize() : Number
      {
         return this._9576;
      }
      
      public function set percentSize(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._9576 = param1;
      }
      
      public function get _2247() : _1379
      {
         return this._9573;
      }
      
      public function set _2247(param1:_1379) : void
      {
         if(this._9573 == param1)
         {
            return;
         }
         if(this._9573)
         {
            this._9573._9568(null,false);
         }
         this._9573 = param1;
         if(this._9573)
         {
            this._9573._9568(this);
            this._9573._9570 = true;
         }
      }
      
      public function get _2241() : _1379
      {
         return this._9572;
      }
      
      public function set _2241(param1:_1379) : void
      {
         if(this._9572 == param1)
         {
            return;
         }
         if(this._9572)
         {
            this._9572._9568(null,false);
         }
         this._9572 = param1;
         if(this._9572)
         {
            this._9572._9568(this);
            this._9572._9570 = false;
         }
      }
      
      public function get _4835() : _1380
      {
         return this._9579;
      }
      
      public function _9568(param1:_1380, param2:Boolean = true) : void
      {
         if(param2 && Boolean(this._9579))
         {
            if(this._9570)
            {
               this._9579._2247 = null;
            }
            else
            {
               this._9579._2241 = null;
            }
         }
         this._9579 = param1;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      public function get explicitWidth() : Number
      {
         return this._8684;
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         if(this._width == param1)
         {
            return;
         }
         this._width = param1;
         this._8684 = param1;
      }
      
      public function get explicitHeight() : Number
      {
         return this._8682;
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         if(this._height == param1)
         {
            return;
         }
         this._height = param1;
         this._8682 = param1;
      }
      
      public function get _7656() : Number
      {
         return this._9574;
      }
      
      public function set _7656(param1:Number) : void
      {
         this._9574 = param1;
      }
      
      public function get _7652() : Number
      {
         return this._9571;
      }
      
      public function set _7652(param1:Number) : void
      {
         this._9571 = param1;
      }
      
      public function _9575(param1:Number, param2:Number) : void
      {
         this._width = param1;
         this._height = param2;
      }
      
      public function get minimized() : Boolean
      {
         return this._2247 && this._2247.minimized && Boolean(this._2241) && this._2241.minimized;
      }
      
      public function set minimized(param1:Boolean) : void
      {
      }
      
      public function get visible() : Boolean
      {
         return Boolean(this._2247) && this._2247.visible || Boolean(this._2241) && this._2241.visible;
      }
   }
}


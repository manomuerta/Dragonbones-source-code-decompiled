package _14097
{
   import _1045.Group;
   import _1045._1105;
   import _1404._1407;
   import _521._528;
   import _724._725;
   import _859._860;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class _14096 extends Group implements _860
   {
      private var _7008:_1105;
      
      private var _bitmapData:BitmapData;
      
      private var _7007:int = 5;
      
      private var _1857:Number = 1;
      
      private var _height:Number;
      
      private var _width:Number;
      
      private var _2101:_725;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _7005:int;
      
      public function _14096()
      {
         super();
         this._7008 = new _1105();
         addElement(this._7008);
      }
      
      public function _6106(param1:Number) : void
      {
         this._1857 = param1;
         this._7008.scaleX = this._1857;
         this._7008.scaleY = this._1857;
         if(this._bitmapData)
         {
            this._width = this._bitmapData.width * this._1857;
            this._height = this._bitmapData.height * this._1857;
         }
      }
      
      public function get scale() : Number
      {
         return this._1857;
      }
      
      public function get _7003() : Number
      {
         if(this._bitmapData)
         {
            return this._bitmapData.width;
         }
         return this._width;
      }
      
      public function get _7002() : Number
      {
         if(this._bitmapData)
         {
            return this._bitmapData.height;
         }
         return this._height;
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         this._5740 = param1;
      }
      
      public function set _5724(param1:Object) : void
      {
         if(this._bitmapData != param1)
         {
            this._bitmapData = param1 as BitmapData;
            this._7008.source = param1;
            this._7008.scaleX = this._1857;
            this._7008.scaleY = this._1857;
            this._width = this._bitmapData.width * this._1857;
            this._height = this._bitmapData.height * this._1857;
            ++this._7005;
            if(this._7005 > 1)
            {
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      public function get _2104() : _725
      {
         return this._2101;
      }
      
      public function set _2104(param1:_725) : void
      {
         this._7005 = 0;
         if(this._2101 != param1)
         {
            if(this._2101 != null)
            {
               this._2101._5725(this);
            }
            this._bitmapData = null;
            this._2101 = param1;
            if(this._2101)
            {
               this._2101._5735(this);
            }
         }
      }
      
      private function get _6211() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function dispose() : void
      {
         if(this._2101)
         {
            this._2101._5725(this);
         }
         this._2101 = null;
      }
   }
}


package _1000
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _1404._1407;
   import _521._528;
   import _724._725;
   import _859._860;
   import _97._100;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class _1002 extends Group implements _860, _999
   {
      private var _7008:_1105;
      
      private var _2541:Label;
      
      private var _2558:_1082;
      
      private var _bitmapData:BitmapData;
      
      private var _7007:int = 5;
      
      private var _1857:Number = 1;
      
      private var _height:Number;
      
      private var _width:Number;
      
      private var _2101:_725;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _7005:int;
      
      public function _1002()
      {
         super();
         this._7008 = new _1105();
         this._2541 = new Label();
         this._2558 = new _1082();
         this._2558.radius = 10;
         this._2558.fillColor = _100.IMAGE_TIP_BG_COLOR;
         addElement(this._2558);
         addElement(this._7008);
         addElement(this._2541);
      }
      
      public function _6106(param1:Number) : void
      {
         this._1857 = param1;
         this._7008.scaleX = this._1857;
         this._7008.scaleY = this._1857;
         this._2558.width = Math.max(this._bitmapData.width * this._1857 + this._7007 * 2,this._2541.textWidth + 10);
         this._2558.height = this._bitmapData.height * this._1857 + 20 + this._7007 * 2;
         this._width = this._2558.width;
         this._height = this._2558.height;
         this._7008.x = (this._width - this._bitmapData.width * this._1857) * 0.5;
         this._7008.y = this._7007;
         this._2541.y = this._height - 20;
         this._2541.x = (this._width - this._2541.textWidth) / 2;
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
            this._2541.text = this._bitmapData.width + "x" + this._bitmapData.height;
            this._2541._6040();
            this._2558.width = Math.max(this._bitmapData.width * this._1857 + this._7007 * 2,this._2541.textWidth + 10);
            this._2558.height = this._bitmapData.height * this._1857 + 20 + this._7007 * 2;
            this._width = this._2558.width;
            this._height = this._2558.height;
            this._2558.x = 0;
            this._2558.y = 0;
            this._7008.x = (this._width - this._bitmapData.width * this._1857) * 0.5;
            this._7008.y = this._7007;
            this._2541.y = this._height - 20;
            this._2541.x = (this._width - this._2541.textWidth) / 2;
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
      }
   }
}


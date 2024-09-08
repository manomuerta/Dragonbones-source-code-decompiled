package _1000
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _1404._1407;
   import _14193._14197;
   import _521._528;
   import _724._725;
   import _859._860;
   import _97._100;
   import flash.events.Event;
   
   public class _14112 extends Group implements _860, _999
   {
      private const MAX_SIZE:int = 300;
      
      private var _7008:_1105;
      
      private var _2541:Label;
      
      private var _2558:_1082;
      
      private var _14340:Object;
      
      private var _7007:int = 5;
      
      private var _1857:Number = 1;
      
      private var _height:Number;
      
      private var _width:Number;
      
      private var _14860:Number = 0;
      
      private var _14861:Number = 0;
      
      private var _14858:Number = 0;
      
      private var _14859:Number = 0;
      
      private var _2101:_725;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _7005:int;
      
      private var _14857:Boolean = false;
      
      public function _14112()
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
         this._2558.width = Math.max(this._14860 * this._1857 + this._7007 * 2,this._2541.textWidth + 10);
         this._2558.height = this._14861 * this._1857 + 20 + this._7007 * 2;
         this._width = this._2558.width;
         this._height = this._2558.height;
         this._7008.x = -this._14858 * this._1857 + (this._width - this._14860 * this._1857) * 0.5;
         this._7008.y = -this._14859 * this._1857 + this._7007;
         this._2541.y = this._height - 20;
         this._2541.x = (this._width - this._2541.textWidth) / 2;
      }
      
      public function get _7003() : Number
      {
         if(this._14340)
         {
            return this._14860;
         }
         return this._width;
      }
      
      public function get _7002() : Number
      {
         if(this._14340)
         {
            return this._14861;
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
         if(this._14340 != param1)
         {
            this._14340 = param1;
            this._14857 = this._14340 is _14197;
            this._14860 = this._14857 ? Number(this._14340._14651) : Number(this._14340.width);
            this._14861 = this._14857 ? Number(this._14340._14650) : Number(this._14340.height);
            this._14858 = this._14857 ? Number(this._14340.offsetX) : 0;
            this._14859 = this._14857 ? Number(this._14340.offsetY) : 0;
            this._7008.source = param1;
            this._7008.scaleX = this._1857;
            this._7008.scaleY = this._1857;
            this._2541.text = this._14860 + "x" + this._14861;
            this._2541._6040();
            this._2558.width = Math.max(this._14860 * this._1857 + this._7007 * 2,this._2541.textWidth + 10);
            this._2558.height = this._14861 * this._1857 + 20 + this._7007 * 2;
            this._width = this._2558.width;
            this._height = this._2558.height;
            this._2558.x = 0;
            this._2558.y = 0;
            this._7008.x = -this._14858 * this._1857 + (this._width - this._14860 * this._1857) * 0.5;
            this._7008.y = -this._14859 * this._1857 + this._7007;
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
            this._14340 = null;
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
      
      public function get element() : Object
      {
         return this._14340;
      }
      
      public function dispose() : void
      {
      }
   }
}


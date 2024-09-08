package _14115
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _127._14040;
   import _1374.IconButton;
   import _1529._1528;
   import _1529._1530;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _14117 extends Group
   {
      protected static const MINSCALE:int = 5;
      
      protected static const MAXSCALE:int = 1000;
      
      protected var _14765:int = 68;
      
      protected var _14923:int;
      
      protected var _14921:int;
      
      protected var _7367:int;
      
      protected var _7360:int;
      
      protected var _7371:int = 0;
      
      protected var _7370:int = 0;
      
      protected var scale:int = 100;
      
      protected var _14909:Boolean = true;
      
      protected var mark:String;
      
      protected var _14905:Group;
      
      protected var _7374:_14040;
      
      protected var _2513:Group;
      
      protected var _14898:Label;
      
      protected var _6155:Label;
      
      protected var _14908:IconButton;
      
      protected var _14907:IconButton;
      
      protected var _6333:Group;
      
      protected var group1:Group;
      
      protected var label1:Label;
      
      protected var _14899:Label;
      
      protected var image:_1105;
      
      public function _14117()
      {
         this._14905 = new Group();
         this._7374 = new _14040();
         this._2513 = new Group();
         this._14898 = new Label();
         this._6155 = new Label();
         this._14908 = new IconButton();
         this._14907 = new IconButton();
         this._6333 = new Group();
         this.label1 = new Label();
         this._14899 = new Label();
         this.image = new _1105();
         super();
         if(_1528.language == _1530.zh_CN)
         {
            this._14765 = 68;
            this.mark = "：";
         }
         else if(_1528.language == _1530.ru_RF)
         {
            this._14765 = 120;
            this.mark = ":";
         }
         else
         {
            this._14765 = 100;
            this.mark = ":";
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         if(this._14923 == param1 && this._14921 == param2)
         {
            return;
         }
         this._14923 = param1;
         this._14921 = param2;
         super._5823(param1,param2);
         this._14893(this._2513.x + this._2513.width - 4,this._2513.y - 5);
         this._7348();
         this._14909 = false;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this._14907.addEventListener(MouseEvent.CLICK,this._14920);
         this._14908.addEventListener(MouseEvent.CLICK,this._14919);
         this._7374.addEventListener(MouseEvent.MOUSE_WHEEL,this._14922);
         this._7374.addEventListener(Event.CHANGE,this._14918);
      }
      
      protected function _7348() : void
      {
         if(this._7370 == 0 || this._7371 == 0)
         {
            return;
         }
         this._7374._14343(this._7370,this._7371);
         if(this._14909)
         {
            this._7374._2894(this._7367,this._7360);
         }
         else
         {
            this._7374._2894(this._7367,this._7360,this.scale / 100);
         }
      }
      
      public function _14893(param1:int, param2:int) : void
      {
         if(this._7370 != param1)
         {
            this._7370 = param1;
            this._7374.width = this._7370;
         }
         if(this._7371 != param2)
         {
            this._7371 = param2;
            this._7374.height = this._7371;
         }
      }
      
      public function _4906() : void
      {
         this._7367 = 0;
         this._7360 = 0;
         this._14909 = true;
         this.scale = 100;
      }
      
      protected function _14754(param1:int) : void
      {
         this.scale = param1;
         if(this.scale < MINSCALE)
         {
            this.scale = MINSCALE;
         }
         if(this.scale > MAXSCALE)
         {
            this.scale = MAXSCALE;
         }
         if(this.image)
         {
            this._7374.scale = this.scale / 100;
            this._3989();
         }
         this._6155.text = String(this.scale) + "%";
      }
      
      protected function _3989() : void
      {
         if(this.scale <= MINSCALE)
         {
            this._14907.enabled = false;
            this._14908.enabled = true;
         }
         else if(this.scale >= MAXSCALE)
         {
            this._14907.enabled = true;
            this._14908.enabled = false;
         }
         else
         {
            this._14907.enabled = true;
            this._14908.enabled = true;
         }
      }
      
      protected function _14920(param1:MouseEvent) : void
      {
         this._14754(this.scale - MINSCALE);
      }
      
      protected function _14919(param1:MouseEvent) : void
      {
         this._14754(this.scale + MINSCALE);
      }
      
      protected function _14922(param1:MouseEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         this._14754(this.scale + param1.delta);
      }
      
      protected function _14918(param1:Event) : void
      {
         this.scale = int(this._7374.scale * 100);
         this._6155.text = String(this.scale) + "%";
      }
   }
}


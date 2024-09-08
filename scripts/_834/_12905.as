package _834
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1374._1387;
   import egret.core._1118;
   import flash.geom.Rectangle;
   
   public class _12905 extends _1084
   {
      private var group:Group;
      
      public var _2578:_1105;
      
      public var _2582:_1105;
      
      public var _2577:_1118;
      
      public var _6672:Label;
      
      private var _color:uint = 6513507;
      
      public function _12905()
      {
         super();
         this.states = ["normal","disabled","normalWithPrompt","disabledWithPrompt"];
         this.minHeight = 23;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.group = new Group();
         this.addElement(this.group);
         this.group.percentHeight = this.group.percentWidth = 100;
         this._2578 = new _1105();
         this._2578.left = this._2578.right = this._2578.top = this._2578.bottom = 0;
         this.group.addElement(this._2578);
         this._2582 = new _1105();
         this._2582.left = this._2582.right = this._2582.top = this._2582.bottom = 0;
         this._2582.scale9Grid = new Rectangle(2,2,1,1);
         this._2582.visible = false;
         this.group.addElement(this._2582);
         this._2577 = new _1387();
         this._2577.textColor = this._color;
         this._2577._6245 = 10;
         this._2577.multiline = false;
         this._2577.left = 5;
         this._2577.right = 5;
         this._2577.verticalCenter = 0;
         this.group.addElement(this._2577);
         this._6672 = new Label();
         this._6672.textColor = this._color;
         this._6672._6080 = 1;
         this._6672.left = 1;
         this._6672.right = 4;
         this._6672.verticalCenter = 0;
         this._6672.verticalAlign = "middle";
         this._6672.mouseEnabled = false;
         this._6672.mouseChildren = false;
         this.group.addElement(this._6672);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._2578.graphics.clear();
         this._2578.graphics.lineStyle(0,this._color);
         this._2578.graphics.beginFill(0,0);
         this._2578.graphics.drawRect(0,0,param1,param2);
         this._2578.graphics.endFill();
         this._2582.graphics.clear();
         this._2582.graphics.lineStyle(0,this._color);
         this._2582.graphics.beginFill(0,0);
         this._2582.graphics.drawRect(0,0,param1,param2);
         this._2582.graphics.endFill();
      }
      
      override protected function _2519() : void
      {
         super._2519();
         this.group.alpha = 1;
         this._2577.alpha = 1;
         switch(_2080)
         {
            case "normal":
               this._6672.visible = false;
               break;
            case "disabled":
               this._6672.visible = false;
               this._2577.alpha = 0.8;
               break;
            case "normalWithPrompt":
               this._6672.visible = true;
               break;
            case "disabledWithPrompt":
               this._6672.visible = true;
               this._2577.alpha = 0.8;
         }
      }
   }
}


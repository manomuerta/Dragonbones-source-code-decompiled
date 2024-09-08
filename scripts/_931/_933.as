package _931
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1374._1387;
   import egret.core._1118;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _933 extends _1084
   {
      protected var group:Group;
      
      public var _2578:_1082;
      
      public var _2582:_1082;
      
      public var _2577:_1118;
      
      public var _6672:Label;
      
      protected var clearInput:_1105;
      
      protected var _6674:String = "/assets/panelIcon/cross.png";
      
      protected var _6673:String = "/assets/panelIcon/search.png";
      
      public function _933()
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
         this._2582 = new _1082();
         this._2582.left = this._2582.right = this._2582.top = this._2582.bottom = 0;
         this._2582.fillColor = 1251358;
         this._2582.visible = false;
         this.group.addElement(this._2582);
         this._2578 = new _1082();
         this._2578.fillColor = 1251358;
         this._2578._2563 = 1251358;
         this._2578._2564 = 1;
         this._2578.left = this._2578.right = this._2578.top = this._2578.bottom = 0;
         this.group.addElement(this._2578);
         this._2577 = new _1387();
         this._2577._6245 = 10;
         this._2577.multiline = false;
         this._2577.left = 5;
         this._2577.right = 5;
         this._2577.verticalCenter = 0;
         this.group.addElement(this._2577);
         this._6672 = new Label();
         this._6672.textColor = 6580589;
         this._6672._6080 = 1;
         this._6672.left = 1;
         this._6672.right = 4;
         this._6672.verticalCenter = 0;
         this._6672.verticalAlign = "middle";
         this._6672.mouseEnabled = false;
         this._6672.mouseChildren = false;
         this.group.addElement(this._6672);
         this.clearInput = new _1105();
         this.clearInput.source = this._6673;
         this.clearInput.right = 8;
         this.clearInput.verticalCenter = 0;
         this.clearInput.addEventListener(MouseEvent.CLICK,function():void
         {
            if(_6081)
            {
               _6081.dispatchEvent(new Event("clearInput"));
            }
         });
         this.group.addElement(this.clearInput);
      }
      
      public function _4527(param1:Boolean) : void
      {
         if(param1)
         {
            this.clearInput.source = this._6674;
            this.clearInput.toolTip = tr("Scene.Tree.SearchTextInput.Clear");
            this.clearInput.mouseEnabled = true;
         }
         else
         {
            this.clearInput.source = this._6673;
            this.clearInput.toolTip = "";
            this.clearInput.mouseEnabled = false;
         }
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
               this._2578._2563 = 6652315;
               this._2578._2564 = 1;
               break;
            case "disabled":
               this._6672.visible = false;
               this._2578._2563 = 6652315;
               this.group.alpha = 0.5;
               this._2577.alpha = 0.5;
               break;
            case "normalWithPrompt":
               this._6672.visible = true;
               this._2578._2563 = 1251358;
               this._2578._2564 = 0;
               break;
            case "disabledWithPrompt":
               this._6672.visible = true;
               this._2578._2563 = 1251358;
               this.group.alpha = 0.5;
               this._2577.alpha = 0.5;
         }
      }
   }
}


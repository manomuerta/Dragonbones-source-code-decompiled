package _13212
{
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1374.IconButton;
   import egret.utils.tr;
   import flash.text.TextFormatAlign;
   
   public class _13216 extends _1084
   {
      public const NORMAL_COLOR:uint = 1909289;
      
      public const OVER_COLOR:uint = 3358281;
      
      public const SELECTED_COLOR:uint = 3100242;
      
      public const DISABLED_COLOR:uint = 255;
      
      public var _13425:_13211;
      
      public var _13426:Label;
      
      public var bg:_1082;
      
      public var _6194:Label;
      
      public var _4197:IconButton;
      
      public function _13216()
      {
         super();
         states = ["normal","over","selected","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.bg = new _1082();
         this._2519();
         this.bg._2563 = 0;
         this.bg._2562 = 2;
         this.bg._2564 = 1;
         this.bg.width = this.width;
         this.bg.height = this.height;
         this.addElement(this.bg);
         this._13425 = new _13211();
         this.addElement(this._13425);
         this._6194 = new Label();
         this._6194.textAlign = TextFormatAlign.CENTER;
         this._6194._6541 = true;
         this._6194.width = this.width;
         this._6194.bottom = 2;
         this.addElement(this._6194);
         this._4197 = new IconButton();
         this._4197.icon = "/assets/button/delAnimation.png";
         this._4197.toolTip = tr("ScenePanel.removeBtn.tooltip");
         this._4197.top = 2;
         this._4197.right = 2;
         this.addElement(this._4197);
         this._13426 = new Label();
         this._13426.width = this.width;
         this._13426.top = 2;
         this._13426.left = 4;
         this.addElement(this._13426);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "normal":
               this.bg.fillColor = this.NORMAL_COLOR;
               break;
            case "over":
               this.bg.fillColor = this.OVER_COLOR;
               break;
            case "selected":
               this.bg.fillColor = this.SELECTED_COLOR;
               break;
            case "disabled":
               this.bg.fillColor = this.DISABLED_COLOR;
               break;
            default:
               this.bg.fillColor = this.NORMAL_COLOR;
         }
      }
   }
}


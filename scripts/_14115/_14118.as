package _14115
{
   import _1045.Group;
   import _1185._1188;
   import _1185._1197;
   import _97._125;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormatAlign;
   
   public class _14118 extends _14117
   {
      private var _5455:BitmapData;
      
      public function _14118()
      {
         super();
         this._14491();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.percentWidth = 100;
         this.percentHeight = 100;
         _2513.percentWidth = 100;
         _14898.text = tr("Export.setting.percent");
         _14898.textAlign = TextFormatAlign.RIGHT;
         _14898.width = _14765;
         _14898.width = 70;
         _14908.icon = "/assets/button/zoom_in.png";
         _14907.icon = "/assets/button/zoom_out.png";
         var _loc1_:Group = _125._2414(3);
         _loc1_.right = 0;
         _loc1_.addElement(_14898);
         _loc1_.addElement(_6155);
         _loc1_.addElement(_14908);
         _loc1_.addElement(_14907);
         _2513.addElement(_loc1_);
         var _loc2_:_1197 = new _1197();
         _loc2_._2401 = _1188.LEFT;
         _loc2_.gap = 3;
         _6333 = new Group();
         _6333.percentWidth = 100;
         _6333.layout = _loc2_;
         group1 = _125._2414(3);
         label1.text = tr("Export.output.size");
         label1.textAlign = TextFormatAlign.RIGHT;
         label1.width = _14765;
         group1.addElement(label1);
         group1.addElement(_14899);
         _6333.bottom = 64;
         _2513.bottom = 125;
         _7374._14339(image);
         _14905.addElement(_7374);
         _6333.addElement(group1);
         this.addElement(_14905);
         this.addElement(_2513);
         this.addElement(_6333);
      }
      
      public function _2894(param1:BitmapData) : void
      {
         this._7066(param1);
      }
      
      private function _7066(param1:BitmapData) : void
      {
         var bmpW:Number;
         var bmpH:Number;
         var s:Number;
         var newBmpD:BitmapData = null;
         var bmpD:BitmapData = param1;
         if(bmpD == null)
         {
            return;
         }
         bmpW = bmpD.width;
         bmpH = bmpD.height;
         s = 1;
         if(bmpW > 6000 || bmpH > 6000)
         {
            s = Math.min(6000 / bmpW,6000 / bmpH,1);
         }
         _7360 = bmpH * s;
         _7367 = bmpW * s;
         try
         {
            if(!image.source)
            {
               _14909 = true;
            }
            newBmpD = this._14490(_7367,_7360);
            newBmpD.draw(bmpD,new Matrix(s,0,0,s,0,0));
            image.source = newBmpD;
            _14899.text = bmpW + " x " + bmpH;
            _7348();
            if(_6155)
            {
               _6155.text = String(scale) + "%";
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function _14490(param1:Number, param2:Number) : BitmapData
      {
         var _loc3_:Sprite = new Sprite();
         var _loc4_:Matrix = new Matrix();
         var _loc5_:Number = 1;
         _loc4_.scale(_loc5_,_loc5_);
         var _loc6_:Graphics = _loc3_.graphics;
         _loc6_.clear();
         _loc6_.beginBitmapFill(this._5455);
         _loc6_.drawRect(0,0,param1,param2);
         _loc6_.endFill();
         var _loc7_:BitmapData = new BitmapData(param1,param2,true,16777215);
         _loc7_.draw(_loc3_);
         return _loc7_;
      }
      
      private function _14491() : void
      {
         var _loc1_:Number = 20;
         var _loc2_:Number = 20;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(5855326);
         _loc3_.graphics.drawRect(0,0,_loc2_ * 2,_loc2_ * 2);
         _loc3_.graphics.beginFill(6513256);
         _loc3_.graphics.drawRect(0,0,_loc2_,_loc2_);
         _loc3_.graphics.drawRect(_loc2_,_loc2_,_loc2_,_loc2_);
         _loc3_.graphics.endFill();
         this._5455 = new BitmapData(_loc1_ * 2,_loc1_ * 2);
         this._5455.draw(_loc3_);
      }
   }
}


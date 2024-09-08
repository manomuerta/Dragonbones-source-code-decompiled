package _12908
{
   import _1045.Group;
   import _1045.Label;
   import _1529._1528;
   import _1529._1530;
   import _97._125;
   
   public class _12911 extends Group
   {
      private var label:Label;
      
      public function _12911(param1:String)
      {
         super();
         horizontalCenter = 0;
         this.label = _125._12836(param1);
         this.label.size = _1528.language == _1530.zh_CN ? 17 : 16;
         this.label.bold = true;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         addElement(this.label);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         graphics.lineStyle(1,0);
         graphics.moveTo(0,param2 / 2);
         graphics.lineTo(param1,param2 / 2);
      }
   }
}


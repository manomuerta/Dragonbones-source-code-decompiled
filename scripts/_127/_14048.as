package _127
{
   import _1045.Group;
   import _1045._1047;
   import _1439._1264;
   
   public class _14048 extends _1264
   {
      private var group1:Group;
      
      public function _14048()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.group1 = new Group();
         this.addElement(this.group1);
         this.group1.percentHeight = this.group1.percentWidth = 100;
         _2577 = new _1047();
         _2577._6245 = 10;
         _2577.multiline = false;
         _2577.left = 5;
         _2577.right = 5;
         _2577.verticalCenter = 0;
         this.group1.addElement(_2577);
         this.group1.addElement(_6672);
      }
   }
}

